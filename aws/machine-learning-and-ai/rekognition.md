# Amazon Rekognition

- A service that makes it easy to add powerful visual analysis to your applications.

- There are two services under Amazon Rekognition:

  - **Rekognition Image** lets you easily build powerful applications to search, verify, and organize millions of images. 
  - **Rekognition Video** lets you extract motion-based context from stored or live stream videos and helps you analyze them.

- Rekognition Image

  - An image recognition service that detects objects, scenes, and faces; extracts text, and many more. 
  - It also allows you to search and compare faces.
  - The service uses deep neural network models to detect and label thousands of objects and scenes in your images.
  - Common use cases
    - Searchable Image Library
    - Face-Based User Verification
    - Sentiment Analysis
    - Facial Recognition
    - Image Moderation
  - Rekognition Image currently supports the **JPEG and PNG** image formats. You can submit images either as an **S3 object (up to 15MB) or as a byte array (up to 5MB)**.
  - Rekognition Image returns the bounding box for each face detected in an image along with its attributes such as sex, accessories, facial features, etc.
  - Using the CompareFaces API, Rekognition Image lets you measure the likelihood that faces in two images are of the same person.

  - Rekognition Video
    - A video recognition service that detects activities; understands the  movement of people in frame; and recognizes objects, celebrities, and  many more in a video.
    - Rekognition Video allows you also to index metadata like objects, activities,  scene, celebrities, and faces that make video search easy.
    - Common use cases
      - Search Index for video archives
      - Easy filtering of video for explicit and suggestive content
    - Rekognition Video operations can analyze videos (up to 8GB) stored in Amazon S3  buckets. The video must be encoded using the H.264 codec. The supported  file formats are **MPEG-4 and MOV**. 
    - With Rekognition Video, you can locate faces across a video and analyze face attributes. 
    - With the **Person Tracking** feature, you can also track each person within a shot and through the video across shots.
    - Rekognition Video uses a **Kinesis Video Stream** as input, to process a video stream. The analysis results are output to a Kinesis data stream and finally read by your client application.
  - Concepts
    - A **label** is an object, scene, or concept found in an image based on its contents.
    - Each label comes with a confidence score. A **confidence score** is a number between 0 and 100 that indicates the probability that a given prediction is correct. 
    - **Object and Scene Detection** is the process of analyzing an image or video to assign labels based on its visual content. Rekognition Image does this through the DetectLabels API.
    - For every label found, Amazon Rekognition returns the parent labels if they exist. This defines if two objects are related to one another under  some certain category. Parents are returned in hierarchical order (from  left to right).
    - **Unsafe Content Detection** is a deep-learning based API for detection of explicit and suggestive  adult content in images. Very useful for filtering inappropriate  content.
    - **Facial Recognition** is the process of identifying or verifying a person’s identity by  searching for their face in a collection of faces. You can create a face collection as your dataset for comparison.
    - Amazon Rekognition can also perform **sentiment and demographic analysis**.
    - **Text in Image** allows you to detect and recognize text within an image, and is  specifically built to work with real-world images rather than document  images.
    - **Celebrity Recognition** is Amazon Rekognition’s feature for recognizing celebrities within supplied images and in videos.
  - Pricing
    - With Rekognition Image, you only pay for the images you analyze and the face metadata you store.
    - Amazon Rekognition Video charges you based on the amount of video time  analyzed and for amount of face metadata stored per month.

Sources:
 https://docs.aws.amazon.com/rekognition/latest/dg/what-is.html
 https://aws.amazon.com/rekognition/faqs/
 https://aws.amazon.com/rekognition/pricing/