from retinaface import RetinaFace
import matplotlib.pyplot as plt
import cv2
import time
import os
import tensorflow as tf
import math

CROP_SIZE_HEIGHT = 1200
CROP_SIZE_WIDTH = 1200

def draw_marks(image, mark, color=(255, 255, 255)):
    """Draw mark points on image"""
    cv2.circle(image, (int(mark[0]), int(
        mark[1])), 10, color, -1, cv2.LINE_AA)
    
if __name__ == "__main__":
    gpus = tf.config.list_physical_devices('GPU')
    print(gpus)
    time_ = 0
    tf.config.set_logical_device_configuration(
        gpus[0],
        [tf.config.LogicalDeviceConfiguration(memory_limit=1024*8)])
    database = "/home/jovyan/poliface/poliface_database/"
    subjects = os.listdir(database)
    # err_path = "/home/jovyan/error_retinaface_new1.txt"
    dest_landmarks = "/home/jovyan/poliface/poliface_database_landmarks_retinaface/"
    dest_landmarks_img = "/home/jovyan/poliface/poliface_database_landmarks_images_retinaface/"
    dest_cropped_faces = "/home/jovyan/poliface/poliface_database_cropped_face_retinaface/"
    idx = 0
    db = []
    ls = []
    # with open(err_path, "r") as f:
    #     for line in f:
    #         line = line.strip(" ").strip("\n")
    #         if "WEBCAM" in line.split("/"):
    #             line = line.replace("txt", "jpg").replace("poliface_database_landmarks_retinaface", "poliface_database")
    #         else:
    #             line = line.replace("txt", "JPG").replace("poliface_database_landmarks_retinaface", "poliface_database")
    #         ls.append(line)
    time1 = time.time()
    # print(ls)
    for s in subjects:
        if "ipynb" not in s:
            db.append(os.path.join(database, s))
    # print(db)
    os.environ["CUDA_VISIBLE_DEVICES"] = "0"
    with tf.device('/device:GPU:0'):
        print("Num GPUs Available: ", len(tf.config.list_physical_devices('GPU')))
    # img = cv2.imread("/home/jovyan/poliface_database/V000001/S003/L1/E01/C1.JPG")
        for d in db:
            subject = d.split("/")[-1]
            sessions = os.listdir(d)
            for s in sessions:
                if "ipynb" not in s:
                    s_path = os.path.join(d, s)
                    lights = os.listdir(s_path)
                    for l in lights:
                        if "ipynb" not in l:
                            l_path = os.path.join(s_path, l)
                            expressions = os.listdir(l_path)
                            for e in expressions:
                                if "ipynb" not in e:
                                    e_path = os.path.join(l_path, e)
                                    img_labels = os.listdir(e_path)
                                    for i in img_labels:
                                        label = i.split(".")[0]
                                        if "ipynb" not in i:
                                            img_path = os.path.join(e_path, i)
                                            idx += 1
                                            # print(img_path + "    " + str(idx))  
                                            if idx > 0:
                                                time0 = time.time()
                                                img = cv2.imread(img_path)
                                                des_img = os.path.join(dest_landmarks_img, subject, s, l, e)
                                                des_landmarks = os.path.join(dest_landmarks, subject, s, l, e)
                                                des_cropped = os.path.join(dest_cropped_faces, subject, s, l, e)
                                                # if os.path.isdir(des_img) is False:
                                                #     os.makedirs(des_img)
                                                # if os.path.isdir(des_landmarks) is False:
                                                #     os.makedirs(des_landmarks)
                                                # if os.path.isdir(des_cropped) is False:
                                                #     os.makedirs(des_cropped)
                                                if os.path.isfile(os.path.join(des_landmarks, label + ".txt")):
                                                    # print(os.path.join(des_landmarks, label + ".txt"))
                                                    with open(os.path.join(des_landmarks, label + ".txt"), 'r') as file:
                                                        a = 0
                                                        for line in file:
                                                            a += 1
                                                else:
                                                    a = 0
                                                if True:
                                                    
                                                    try:
                                                        print(img_path + "    " + str(idx))
                                                        resp = RetinaFace.detect_faces(img, threshold=0.001)
                                                        time_ = time.time() - time0
                                                        print(time_)
                                                        # for face in faces:
                                                        #     idx += 1
                                                        #     cv2.imwrite("/home/jovyan/test_" + str(idx) + ".JPG", face)
                                                        #     print(face)
                                                        # print(lab)
                                                        # print(resp)
                                                        print(str(type(resp)))
                                                        if type(resp) == dict:
                                                            facial_area = resp['face_1']['facial_area']
                                                            w = facial_area[3] - facial_area[1]
                                                            h = facial_area[2] - facial_area[0]
                                                            delta_w = math.ceil((w-CROP_SIZE_WIDTH)/2)
                                                            delta_h = math.ceil((h-CROP_SIZE_HEIGHT)/2)
                                                            if (w - 2*delta_w) == 1199:
                                                                x_w = facial_area[1] + delta_w - 1
                                                            else:
                                                                x_w = facial_area[1] + delta_w

                                                            if (h - 2*delta_h) == 1199:
                                                                x_h = facial_area[0] + delta_h - 1
                                                            else:
                                                                x_h = facial_area[0] + delta_h
                                                            if x_w < 90:
                                                                x_w = 90
                                                            if x_h < 0:
                                                                x_h = 0
                                                            if "WEBCAM" in img_path:
                                                                obj = img[facial_area[1] : facial_area[3], facial_area[0] : facial_area[2]]
                                                            else:
                                                                obj = img[x_w - 90 : facial_area[3] - delta_w - 90, x_h : facial_area[2] - delta_h]
                                                            print(facial_area)
                                                            print(obj.shape) 

                                                            cv2.imwrite(os.path.join(des_cropped, label + "_cropped_face.JPG"), obj)
                                                            for mark in resp['face_1']['landmarks']:
                                                                # print(mark)
                                                                # print(resp['face_1']['landmarks'][mark][0])
                                                                draw_marks(img, resp['face_1']['landmarks'][mark], (0, 0, 255))

                                                            cv2.imwrite(os.path.join(des_img, label + "_landmarks_labeled.JPG"), cv2.resize(img, (int(img.shape[1]/4), int(img.shape[0]/4))))
                                                            with open(os.path.join(des_landmarks, label + ".txt"), 'w') as file:
                                                                for mark in resp['face_1']['landmarks']:
                                                                    file.write(str(resp['face_1']['landmarks'][mark][0]) + " " + str(resp['face_1']['landmarks'][mark][1]) + "\n")
                                                                file.write(str(facial_area[0]) + " " + str(facial_area[1]) + "\n")
                                                                file.write(str(facial_area[2]) + " " + str(facial_area[3]) + "\n")


                                                        else:
                                                            with open("/home/jovyan/error_retinaface.txt", "a") as file:
                                                                file.write(img_path + "\n")
                                                                break
                                                    except:
                                                        print("error")
                                                        with open("/home/jovyan/error_retinaface.txt", "a") as file:
                                                            file.write(img_path + "\n")
                                                            break
