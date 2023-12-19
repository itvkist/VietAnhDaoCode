import requests
import cv2
import base64
import os
from random import randint

def convert2Base64(image):
    retval, buffer = cv2.imencode('.jpg', image)
    jpg_as_text = base64.b64encode(buffer)
    img_str = 'data:image/jpg;base64,' + str(jpg_as_text)[2:-1]
    return img_str

path = "../images" #images folder contains folders id1, id2, ... idn. each id folder contain images (number of image > 3) of one identification

# Tạo cây với 3 ảnh đầu
for i, dir_ in enumerate(os.listdir(path)):
    for j, f in enumerate(os.listdir(path + '/' + dir_)[:3]):
        print(path + '/' + dir_ + '/' + f)
        image = cv2.imread(path + '/' + dir_ + '/' + f)
        print(i, j)
        r = requests.post('http://localhost:5001/facereg', json={'ann_id': 'abc', 'id': str((i + 1)*10 + j), 'img': convert2Base64(image), 'local_register': False})
        res = r.json()
        del res['result']['feats']
        print(res)

# Query các ảnh còn lại
for dir_ in os.listdir(path):
    for f in os.listdir(path + '/' + dir_):
        image = cv2.imread(path + '/' + dir_ + '/' + f)
        r = requests.post('http://localhost:5001/facerec', json={'ann_id': 'abc', 'img': convert2Base64(image), 'local_register': False})
        res = r.json()
        del res['result']['feats']
        print(res)

# Xóa ngẫu nhiên 1 trong 3 ảnh đầu khỏi cây ann
for i, dir_ in enumerate(os.listdir(path)):
    j = randint(0,2)
    r = requests.post('http://localhost:5001/facedel', json={'ann_id': 'abc', 'ids': [str((i + 1)*10 + j)]})
    res = r.json()
    print(res)

# Query các ảnh còn lại
for dir_ in os.listdir(path):
    for f in os.listdir(path + '/' + dir_):
        image = cv2.imread(path + '/' + dir_ + '/' + f)
        r = requests.post('http://localhost:5001/facerec', json={'ann_id': 'abc', 'img': convert2Base64(image), 'local_register': True})
        res = r.json()
        del res['result']['feats']
        print(res)
