import os
import numpy as np
import cv2
from PIL import Image
from numpy import dot, sqrt
import math

from aiohttp import web
from aiohttp import client
import aiohttp
import asyncio

import torch
import torch.utils.data as data
import torchvision.datasets as datasets
import torch.nn.functional as F
import torchvision.transforms as transforms
from torch.autograd import Variable

from app.arcface.backbone import Backbone
from app.vision.ssd.config.fd_config import define_img_size
from app.vision.ssd.mb_tiny_RFB_fd import create_Mb_Tiny_RFB_fd, create_Mb_Tiny_RFB_fd_predictor

#FACE3D
from deep3d.util.load_mats import load_lm3d
from deep3d.options.test_options import TestOptions
from deep3d.models import create_model
from deep3d.util.visualizer import MyVisualizer
from deep3d.util.preprocess import align_img

#FACE_DREAM
from face_dream.dream import Branch, norm_angle

import face_alignment
import hnswlib

import base64
import requests

from datetime import datetime

app = web.Application(client_max_size=200*1024**2)

device = 'cuda' if torch.cuda.is_available() else 'cpu'

#Face Detection Model
class_names = [name.strip() for name in open('./app/vision/detect_RFB_640/voc-model-labels.txt').readlines()]
candidate_size = 1000
threshold = 0.7
input_img_size = 640
define_img_size(input_img_size)
model_path = "./app/vision/detect_RFB_640/version-RFB-640.pth"
net = create_Mb_Tiny_RFB_fd(len(class_names), is_test=True, device=device)
face_detection = create_Mb_Tiny_RFB_fd_predictor(net, candidate_size=candidate_size, device=device)
net.load(model_path)

#Face Recognition Model
input_size=[112, 112]
transform = transforms.Compose(
        [
            transforms.Resize(
                [int(128 * input_size[0] / 112), int(128 * input_size[0] / 112)],
            ),  # smaller side resized
            transforms.CenterCrop([input_size[0], input_size[1]]),
            # transforms.Resize([input_size[0], input_size[1]]),
            transforms.ToTensor(),
            transforms.Normalize(mean=[0.5, 0.5, 0.5], std=[0.5, 0.5, 0.5]),
        ],
)
face_recognition = Backbone(input_size)
face_recognition.load_state_dict(torch.load('./app/arcface/ms1mv3_arcface_r50_fp16/backbone_ir50_ms1m_epoch120.pth', map_location=torch.device("cpu")))
face_recognition.to(device)
face_recognition.eval()

#Face Mask/Glass Classification Model
data_transform = transforms.Compose([
  transforms.Resize((224,224)),
  transforms.ToTensor()
])
accessories_classify = torch.load('./app/accessories_classification/shuffle0_0_epoch_47.pth', map_location=device)
accessories_classify.eval()

#Face Landmark Model
face_landmark = face_alignment.FaceAlignment(face_alignment.LandmarksType.TWO_D, device='cpu', face_detector='blazeface')

#Face 3D Model
fa = face_alignment.FaceAlignment(face_alignment.LandmarksType.TWO_D, device='cpu', face_detector='blazeface')
opt = TestOptions().parse()
model_deep3d = create_model(opt)
model_deep3d.setup(opt)
model_deep3d.device = device
model_deep3d.parallelize()
model_deep3d.eval()
visualizer = MyVisualizer(opt)
lm3d_std = load_lm3d('./deep3d/BFM') 

#Face DREAM Model
model_dream = Branch(feat_dim=512)
# model.cuda()
checkpoint = torch.load('../face_dream/checkpoint_512.pth')
model_dream.load_state_dict(checkpoint['state_dict'])
model_dream.eval()

def loadBase64Img(uri):
    encoded_data = uri.split(',')[1]
    nparr = np.frombuffer(base64.b64decode(encoded_data), np.uint8)
    img = cv2.imdecode(nparr, cv2.IMREAD_COLOR)
    return img

def load_image(img):
	exact_image = False; base64_img = False; url_img = False

	if type(img).__module__ == np.__name__:
		exact_image = True
	elif len(img) > 11 and img[0:11] == "data:image/":
		base64_img = True
	elif len(img) > 11 and img.startswith("http"):
		url_img = True

	if base64_img == True:
		img = loadBase64Img(img)
	elif url_img:
		img = np.array(Image.open(requests.get(img, stream=True).raw))
	elif exact_image != True: #image path passed as input
		if os.path.isfile(img) != True:
			raise ValueError("Confirm that ",img," exists")
		img = cv2.imread(img)
    
	return img

def check_accessories(image):
    image_tensor = data_transform(image)
    image_tensor = image_tensor.unsqueeze_(0)
    input_ = Variable(image_tensor)
    input_ = input_.to(device)
    output = accessories_classify(input_)
    probabilities = torch.nn.functional.softmax(output[0], dim=0)
    # print(probabilities)
    index = probabilities.data.cpu().numpy().argmax()
    return index

def convert_landmark(img):    
    image = np.array(img)
    preds = face_landmark.get_landmarks_from_image(image)[0]
    left_eye_x = (preds[37][0] + preds[40][0])/2
    left_eye_y = (preds[37][1] + preds[40][1])/2

    right_eye_x = (preds[43][0] + preds[46][0])/2
    right_eye_y = (preds[43][1] + preds[46][1])/2

    nose_x = (preds[30][0] + preds[33][0])/2
    nose_y = (preds[30][1] + preds[33][1])/2

    mouth_left_x = preds[48][0]
    mouth_left_y = preds[48][1]

    mouth_right_x = preds[54][0]
    mouth_right_y = preds[54][1]

    #create numpy ndarray 
    landmark = np.array([[left_eye_x, left_eye_y], 
        [right_eye_x, right_eye_y], 
        [nose_x, nose_y], 
        [mouth_left_x, mouth_left_y], 
        [mouth_right_x, mouth_right_y]], 
        dtype='f')

    # return landmark, img
    return landmark

def estimatePose(frame, landmarks):
    """Calculate poses"""
    size = frame.shape #(height, width, color_channel)
    image_points = np.array([
                            (landmarks[30][0], landmarks[30][1]),     # Nose tip
                            (landmarks[8][0], landmarks[8][1]),       # Chin
                            (landmarks[36][0], landmarks[36][1]),     # Left eye left corner
                            (landmarks[45][0], landmarks[45][1]),     # Right eye right corne
                            (landmarks[48][0], landmarks[48][1]),     # Left Mouth corner
                            (landmarks[54][0], landmarks[54][1])      # Right mouth corner
                        ], dtype="double")
    model_points = np.array([
                            (0.0, 0.0, 0.0),             # Nose tip
                            (0.0, -330.0, -65.0),        # Chin
                            (-165.0, 170.0, -135.0),     # Left eye left corner
                            (165.0, 170.0, -135.0),      # Right eye right corne
                            (-150.0, -150.0, -125.0),    # Left Mouth corner
                            (150.0, -150.0, -125.0)      # Right mouth corner                         
                        ])

    # Camera internals
 
    center = (size[1]/2, size[0]/2)
    focal_length = center[0] / np.tan(60/2 * np.pi / 180)
    camera_matrix = np.array(
                         [[focal_length, 0, center[0]],
                         [0, focal_length, center[1]],
                         [0, 0, 1]], dtype = "double"
                         )

    dist_coeffs = np.zeros((4,1)) # Assuming no lens distortion
    (success, rotation_vector, translation_vector) = cv2.solvePnP(model_points, image_points, camera_matrix, dist_coeffs)#, flags=cv2.CV_ITERATIVE)
    
    axis = np.float32([[500,0,0], 
                          [0,500,0], 
                          [0,0,500]])
                          
    imgpts, jac = cv2.projectPoints(axis, rotation_vector, translation_vector, camera_matrix, dist_coeffs)
    modelpts, jac2 = cv2.projectPoints(model_points, rotation_vector, translation_vector, camera_matrix, dist_coeffs)
    rvec_matrix = cv2.Rodrigues(rotation_vector)[0]

    proj_matrix = np.hstack((rvec_matrix, translation_vector))
    eulerAngles = cv2.decomposeProjectionMatrix(proj_matrix)[6] 
    
    pitch, yaw, roll = [math.radians(_) for _ in eulerAngles]

    pitch = math.degrees(math.asin(math.sin(pitch)))
    roll = -math.degrees(math.asin(math.sin(roll)))
    yaw = math.degrees(math.asin(math.sin(yaw)))

    return str(int(roll)), str(int(pitch)), str(int(yaw)), image_points

#reconstruct 3d face function
def reconstruct(im, lm):
    print ('Img size:', im.size)
    W,H = im.size
    lm = lm.reshape([-1, 2])
    lm[:, -1] = H - 1 - lm[:, -1]
    _, im, lm, _ = align_img(im, lm, lm3d_std)
    
    im_tensor = torch.tensor(np.array(im)/255., dtype=torch.float32).permute(2, 0, 1).unsqueeze(0)
    lm_tensor = torch.tensor(lm).unsqueeze(0)
    
    data = {
        'imgs': im_tensor,
        'lms': lm_tensor
    }
    
    model_deep3d.set_input(data)  # unpack data from data loader
    model_deep3d.test()           # run inference
        
    recon_shape, tri, recon_tex = model_deep3d.export_mesh()
        
    return recon_shape, tri, recon_tex

#rasterize 3d face
def rasterize():
    visuals = model_deep3d.get_current_visuals()  # get image results
    result = visualizer.save_img(visuals)

    b,g,red = cv2.split(result)
    result = cv2.merge((red,g,b))

    return result

#main api function
def unmask(input_img):
    
    lm = convert_landmark(input_img)
    
    shape, tri, texture = reconstruct(input_img, lm)
    
    recon_img = rasterize()
    
    return recon_img

def dream_embedding(embedding_I, input_yaw):
    yaw = np.zeros([1, 1])
    yaw[0,0] = norm_angle(float(input_yaw))
    original_embedding_tensor = np.expand_dims(embedding_I.detach().cpu().numpy(), axis=0)
    # feat = torch.autograd.Variable(torch.from_numpy(feat.astype(np.float32)), volatile=True).cuda()
    # yaw = torch.autograd.Variable(torch.from_numpy(yaw.astype(np.float32)), volatile=True).cuda()
    feature_original = torch.autograd.Variable(torch.from_numpy(original_embedding_tensor.astype(np.float32)))
    yaw = torch.autograd.Variable(torch.from_numpy(yaw.astype(np.float32)))

    new_embedding = model_dream(feature_original, yaw)
    new_embedding = new_embedding.cpu().data.numpy()
    #new_embedding = new_embedding.to(device).data.numpy()
    embedding_I = new_embedding[0, :]
    return embedding_I

def cosine_similarity(x, y):
    return dot(x, y) / (sqrt(dot(x, x)) * sqrt(dot(y, y)))

def get_embeddings(img_input, ann_id, local_register = False, register=False):
    # img = []
    img = load_image(img_input)
    image = cv2.cvtColor(img, cv2.COLOR_BGR2RGB)
    if not local_register:
        boxes, labels, probs = face_detection.predict(image, candidate_size / 2, threshold)
        boxes = boxes.detach().cpu().numpy()
    else:
        boxes = np.array([[0, 0, image.shape[1], image.shape[0]]])

    feats_np = []
    feats = []
    images = []
    bboxes = []
    ids = []
    accessories = []
    distances_ = []
    poses = []
    if not register:
        p = hnswlib.Index(space = 'cosine', dim = 512)
        p.load_index("indexes/index_" + ann_id + '.bin')
    for i in range(boxes.shape[0]):
        box = boxes[i, :]
        xmin, ymin, xmax, ymax = box
        xmin -= (xmax-xmin)/18
        xmax += (xmax-xmin)/18
        ymin -= (ymax-ymin)/18
        ymax += (ymax-ymin)/18
        xmin = 0 if xmin < 0 else xmin
        ymin = 0 if ymin < 0 else ymin
        xmax = image.shape[1] if xmax >= image.shape[1] else xmax
        ymax = image.shape[0] if ymax >= image.shape[0] else ymax
        boxes[i,:] = [xmin, ymin, xmax, ymax]
        infer_img = image[int(ymin): int(ymax), int(xmin): int(xmax), :]
        person_id = ['-1', '-1', '-1']
        distance = ['0', '0', '0']
        accessory_id = 2
        if infer_img is not None and infer_img.shape[0] != 0 and infer_img.shape[1] != 0:
            with torch.no_grad():
                #ALL PIPELINE ---------------------------------------------------------------------!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                accessory_id = check_accessories(Image.fromarray(infer_img))
                if accessory_id == 1:
                   PIL_image = Image.fromarray(np.uint8(infer_img)).convert('RGB')
                   infer_img = unmask(PIL_image)
                   cv2.imwrite("infer_img.jpg", infer_img)
                feat = F.normalize(face_recognition(transform(Image.fromarray(infer_img)).unsqueeze(0).to(device))).cpu()
                preds = face_landmark.get_landmarks_from_image(infer_img)[0]
                roll, pitch, yaw, _ = estimatePose(infer_img, preds)
                ang = 3
                if int(yaw) >= -ang and int(yaw) <= ang:
                    feat = dream_embedding(feat, yaw)  
                #ALL PIPELINE ---------------------------------------------------------------------!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                if not register:
                    try:
                        neighbors, distances = p.knn_query(feat.detach().cpu().numpy(), k=3)
                        if (distances[0][0] <= 0.55 and accessory_id != 1) or (distances[0][0] <= 0.75 and accessory_id == 1):
                            person_id = [str(n) for n in neighbors[0]]
                            distance = [str(d) for d in distances[0]]
                    except Exception as e:
                        print(e)
                        person_id = ['-1', '-1', '-1']
                        distance = ['0', '0', '0']

            feats.append(np.array2string(feat.detach().cpu().numpy()))
            feats_np.append(feat.detach().cpu().numpy())
            images.append(infer_img.copy())
            bboxes.append("{} {} {} {}".format(xmin, ymin, xmax, ymax))
            accessories.append(str(accessory_id))
            ids.append(person_id)
            distances_.append(distance)
            poses.append([str(roll), str(pitch), str(yaw)])

    
    return feats_np, feats, images, bboxes, accessories, ids, distances_, poses

async def facerec(request):
    """
    ---
    ann_id
    img
    local_register
    """
    req = await request.json()

    ann_id = ""
    if "ann_id" in list(req.keys()):
        ann_id = req["ann_id"]

    img_input = ""
    if "img" in list(req.keys()):
        img_input = req["img"]

    print(f'[{datetime.now().strftime("%Y-%m-%d %H:%M:%S.%f")}] info: POST: /facerec, ann_id:{ann_id}')

    validate_img = False
    if len(img_input) > 11 and len(ann_id) > 0 and (img_input[0:11] == "data:image/" or img_input[0:4] == "http"):
        validate_img = True

    if validate_img != True:
        return  web.json_response({"result": {'message': 'Vui lòng truyền ảnh dưới dạng Base64'}}, status=400)

    if 'local_register' in list(req.keys()):
        _, feats, images, bboxes, accessories, ids, distances, poses = get_embeddings(img_input, ann_id, req['local_register'])
    else:
        _, feats, images, bboxes, accessories, ids, distances, poses = get_embeddings(img_input, ann_id)

    return  web.json_response({'result': {"bboxes": bboxes, "feats": feats, "ids": ids, "distances": distances, "accessories": accessories, "poses": poses}}, status=200)

async def facereg(request):
    """
    ---
    ann_id
    id
    img
    local_register
    """
    req = await request.json()

    ann_id = ""
    if "ann_id" in list(req.keys()):
        ann_id = req["ann_id"]

    img_input = ""
    if "img" in list(req.keys()):
        img_input = req["img"]

    id_ = ""
    if "id" in list(req.keys()):
        id_ = req["id"]

    print(f'[{datetime.now().strftime("%Y-%m-%d %H:%M:%S.%f")}] info: POST: /facereg, ann_id:{ann_id}, id:{id_}')

    validate_img = False
    if len(img_input) > 11 and len(id_) > 0 and len(ann_id) > 0 and (img_input[0:11] == "data:image/" or img_input[0:4] == "http"):
        validate_img = True

    if validate_img != True:
        return  web.json_response({"result": {'message': 'Vui lòng truyền ảnh dưới dạng Base64'}}, status=400)

    if 'local_register' in list(req.keys()):
        feats_np, feats, images, bboxes, accessories, ids, _, poses = get_embeddings(img_input, ann_id, req['local_register'], True)
    else:
        feats_np, feats, images, bboxes, accessories, ids, _, poses = get_embeddings(img_input, ann_id, True, True)

    p = hnswlib.Index(space = 'cosine', dim = 512)
    if not os.path.isfile("indexes/index_" + ann_id + '.bin'):
        p.init_index(max_elements = 1000, ef_construction = 200, M = 16)
        p.set_ef(10)
        p.set_num_threads(4)
        p.save_index("indexes/index_" + ann_id + '.bin')
    else:
        p.load_index("indexes/index_" + ann_id + '.bin', max_elements=1000)

    for feat in feats_np[:1]:
        p.add_items(feat, np.array([int(id_)]))
        p.save_index("indexes/index_" + ann_id + '.bin')
        try:
            p.unmark_deleted(int(id_))
        except:
            break

    return  web.json_response({'result': {"bboxes": bboxes, "feats": feats, "accessories": accessories, "register_id": id_, "message": "success"}}, status=200)

async def facedel(request):
    """
    ---
    ann_id
    ids
    """
    req = await request.json()

    ann_id = ""
    if "ann_id" in list(req.keys()):
        ann_id = req["ann_id"]

    ids = []
    if "ids" in list(req.keys()):
        ids = req["ids"]

    print(f'[{datetime.now().strftime("%Y-%m-%d %H:%M:%S.%f")}] info: POST: /facedel, ann_id:{ann_id}, ids:{ids}')

    p = hnswlib.Index(space = 'cosine', dim = 512)
    p.load_index("indexes/index_" + ann_id + '.bin', max_elements=1000)

    id_ = None
    try:
        for id_ in ids:
            p.mark_deleted(int(id_))
        p.save_index("indexes/index_" + ann_id + '.bin')
    except Exception as e:
        print(e)
        return  web.json_response({'result': {"message": "failed", "id": str(id_)}}, status=500)

    return  web.json_response({'result': {"message": "success", "ids": ids}}, status=200)


app.router.add_route('POST',"/facerec", facerec)
app.router.add_route('POST',"/facereg", facereg)
app.router.add_route('POST',"/facedel", facedel)

if __name__ == "__main__":
    web.run_app(app, port=5001)