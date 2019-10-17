%           ______   ____    ____    ____                 %
%          /\__  _\ /\  _`\ /\  _`\ /\  _`\               %
%          \/_/\ \/ \ \ \L\ \ \ \L\ \ \ \L\ \             %
%             \ \ \  \ \ ,__/\ \ ,__/\ \ ,  /             %
%              \_\ \__\ \ \/  \ \ \/  \ \ \\ \            %
%              /\_____\\ \_\   \ \_\   \ \_\ \_\          %
%              \/_____/ \/_/    \/_/    \/_/\/ /          %

%{
                  Hayden Nicholls – 12966026
                  Julia Manning - 12875795
                  Joshua Lake - 12576930
                  Harrison Jeffs - 12966370
                  Patrichia Meleka – 12918835
                  Varun Khushal - 13208297
%}


%=========================================================%
%=========================================================%


%---GLOBAL VARIABLES---%
numberOfTrainImages = 500; %will be multiplied by number of training sets used. change this up to 10,000 depending on size of your test
numberOfTestImages = 500; %change this up to 10,000 depending on size of your test

%--SELECT WHICH DETECTION METHODS WILL BE USED--%
useMethods = ["numObjects", "hog", "eccentricity", "colours"]; %eccentricity and numObjects can NOT be used on their own. default is: ["numObjects", "hog", "eccentricity", "colours"]

%--SELECT WHICH IMAGE DATASETS WILL BE USED WHEN TRAINING--%
useImageDataset = [1 2 3 4 5]; %default is: [1 2 3 4 5]


%=========================================================%
%=========================================================%


%---SCRIPTS TO BE RUN---%

%extract dataset from .tar.gz file
Extract_Dataset

%loads images from dataset into readable images with corresponding labels
Load_Images

%creates a bag of features for each vehicle training image using the HOG
%feature detector
Bag_Of_Features %includes pre-processing and shape detection

%script used for practicing and testing ideas
%Practice_Range

%create and train bayes classifier
Bayes_Classifier

%provide evaluation test data
Evaluation