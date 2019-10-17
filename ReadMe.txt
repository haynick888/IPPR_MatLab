Open MATLAB with the folder MatLab_Project as your root directory.

You can edit the global variables at the top of the Main.m file:
	numberOfTrainImages is the number of images that will be loaded from each dataset for classifier training.

	numberOfTestImages is the number of images that will be loaded for testing the classifier.

	useMethods is an array of the feature detection methods that will be used and loaded into the bag of features.
		numObjects counts the number of objects detected in a highly eroded image.
		HOG applies the hog image detector method to each image,
		eccentricity calculates the eccentricity of each image after erosion
		colours calculates the rgb colour popularity within each image
	NOTE: You can NOT use eccentricity or numObjects on their own.

	useImageDataset lists the datasets that will be used when training the classifier. There are 5 datasets, each labelled 1 through to 5.
	NOTE: Total training images used = numberOfTrainImages * number of datatsets used


To run the program, execute Main.m in MATLAB.
Once this has finished processing, you will be presented with 2 windows.
Figure 1: Confusion Matrix. This displays the confusion matrix and scores of the classifier.
Figure 2: HOG Examples. This presents 4 random examples of HOG features detected on 4 images that were used for training.



USING MATLAB VERSION AND TOOLBOXES:

MATLAB Version: 9.7.0.1190202 (R2019b)
MATLAB License Number: 1078445
Operating System: Microsoft Windows 10 Home Version 10.0 (Build 18362)
Java Version: Java 1.8.0_202-b08 with Oracle Corporation Java HotSpot(TM) 64-Bit Server VM mixed mode
-----------------------------------------------------------------------------------------------------
MATLAB                                                Version 9.7         (R2019b)
Simulink                                              Version 10.0        (R2019b)
Computer Vision Toolbox                               Version 9.1         (R2019b)
Control System Toolbox                                Version 10.7        (R2019b)
DSP System Toolbox                                    Version 9.9         (R2019b)
Data Acquisition Toolbox                              Version 4.0.1       (R2019b)
Deep Learning Toolbox                                 Version 13.0        (R2019b)
Image Processing Toolbox                              Version 11.0        (R2019b)
Instrument Control Toolbox                            Version 4.1         (R2019b)
Optimization Toolbox                                  Version 8.4         (R2019b)
Signal Processing Toolbox                             Version 8.3         (R2019b)
Simulink Control Design                               Version 5.4         (R2019b)
Statistics and Machine Learning Toolbox               Version 11.6        (R2019b)
Symbolic Math Toolbox                                 Version 8.4         (R2019b)