# [Face Recognition VKIST](http://123.16.55.212:85/) 

 [![Tweet](https://img.shields.io/twitter/url/http/shields.io.svg?style=social&logo=twitter)](https://twitter.com/daovietanh99)
 ![version](https://img.shields.io/badge/version-1.0.1-blue.svg) 
 
 ## Quick start

> UNZIP the sources or clone the private repository. After getting the code, open a terminal and navigate to the working directory, with product source code.

```bash
$ # Get the code
$ git clone https://github.com/itvkist/VietAnhDaoCode.git
$ git checkout Face_SaaS
$ cd Face_SaaS
$
$ # Get the weight of arcface and put it on folder app/arcface/ms1mv3_arcface_r50_fp16
$ wget https://github.com/itvkist/VietAnhDaoCode/releases/download/v1.0.0/backbone_ir50_ms1m_epoch120.pth
$ mkdir app/arcface/ms1mv3_arcface_r50_fp16/
$ mv backbone_ir50_ms1m_epoch120.pth app/arcface/ms1mv3_arcface_r50_fp16/
$
$ # Get the weight of ultralight weight face detection and put it on folder app/vision/detect_RFB_640
$ wget https://github.com/itvkist/VietAnhDaoCode/releases/download/v1.0.0/version-RFB-640.pth
$ mkdir app/vision/detect_RFB_640/
$ mv version-RFB-640.pth app/vision/detect_RFB_640/
$
$ # Get the labels file of ultralight weight face detection and put it on folder app/vision/detect_RFB_640
$ wget https://github.com/itvkist/VietAnhDaoCode/releases/download/v1.0.0/voc-model-labels.txt
$ mv voc-model-labels.txt app/vision/detect_RFB_640/
$
$ # Get the BFM model and put it on folder deep3d
$ wget https://github.com/itvkist/VietAnhDaoCode/releases/download/v1.0.0/BFM.zip
$ mv BFM.zip deep3d/
$ unzip BFM.zip
$
$ # Get the deep3d checkpoints and put it on folder deep3d
$ wget https://github.com/itvkist/VietAnhDaoCode/releases/download/v1.0.0/checkpoints.zip
$ mv checkpoints.zip deep3d/
$ unzip checkpoints.zip
$
$ # Virtualenv modules installation (Unix based systems)
$ virtualenv env
$ source env/bin/activate
$
$ # Virtualenv modules installation (Windows based systems)
$ virtualenv env
$ .\env\Scripts\activate
$
$ # Install modules
$ pip3 install -r requirements.txt
$
$ # Start the application (development mode)
$ python3 app.py
$
$ # Access the dashboard in browser: http://127.0.0.1:5000/
```

> Note: To use the app, please access the registration page and create a new user. After authentication, the app will unlock the private pages.


## File Structure
Within the download you'll find the following directories and files:

```bash
< PROJECT ROOT >
   |
   |-- apps/
   |    |
   |    |-- accessories_classification/
   |    |    |-- shuffle0_0_epoch_47.pth             # Weight of accessories classification model
   |    |   
   |    |-- arcface/
   |    |    |-- ms1mv3_arcface_r50_fp16/       
   |    |    |    |-- backbone_ir50_ms1m_epoch120.pth      # Weight of arcface model
   |    |    |-- backbone.py                               # Models code of arcface
   |    |
   |    |-- vision/
   |    |    |-- <models code>                        # Models code of face detection
   |    |    |-- detect_RFB_640/                
   |    |    |-- version-RFB-640.pth                  # Weight of face detection model
   |    |    |-- voc-model-labels.txt                 # Labels of face detection model 
   |    |
   |    |
   |    __init__.py                                   # Initialize the app
   |
   |-- deep3d                                         # Deep3DFace project
   |
   |-- face_dream                                     # DREAM project
   |
   |-- static/
   |    |-- <css, JS, images>                         # CSS files, Javascripts files
   |
   |-- templates/                   
   |    |-- index.html                                # main HTML chunks and components
   |
   |-- requirements.txt                               # Development modules
   |-- create_app.py                                  # Create Database, Configure the app
   |-- app.py                                         # Start the app - WSGI gateway - SocketIO gateway
   |
   |-- ************************************************************************
```

