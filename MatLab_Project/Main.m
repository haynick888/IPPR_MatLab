%           ______   ____    ____    ____                 %
%          /\__  _\ /\  _`\ /\  _`\ /\  _`\               %
%          \/_/\ \/ \ \ \L\ \ \ \L\ \ \ \L\ \             %
%             \ \ \  \ \ ,__/\ \ ,__/\ \ ,  /             %
%              \_\ \__\ \ \/  \ \ \/  \ \ \\ \            %
%              /\_____\\ \_\   \ \_\   \ \_\ \_\          %
%              \/_____/ \/_/    \/_/    \/_/\/ /          %

%{
		  Hayden Nicholls – 12966026 - (Feature Detection, Bag of Features, and Bayes Classifier)
		  Julia Manning - 12875795 - (Bayes Classifier and Bayes Cost)
		  Joshua Lake - 12576930 - (Image Pre-Processing and Number of Objects)
		  Harrison Jeffs - 12966370 - (Evaluation - Confusion Matrix)
		  Patrichia Meleka – 12918835 - (Evaluation - Scores)
		  Varun Khushal - 13208297 - (Image Pre-Processing and Number of Objects)
%}


%=========================================================%
%=========================================================%


%---GLOBAL VARIABLES---%
numberOfTrainImages = 2000; %recommended 2000. must be at least 50. will be multiplied by number of training sets used. change this up to 10,000 depending on size of your test
numberOfTestImages = 2000; %recommended 2000. must be at least 1. change this up to 10,000 depending on size of your test

%--SELECT WHICH DETECTION METHODS WILL BE USED--%
useMethods = ["numObjects", "hog", "eccentricity", "colours"]; %eccentricity and numObjects can NOT be used on their own. default is: ["numObjects", "hog", "eccentricity", "colours"]

%--SELECT WHICH IMAGE DATASETS WILL BE USED WHEN TRAINING--%
useImageDataset = [1 2 3 4 5]; %must include at least 2 datasets. default and maximum is: [1 2 3 4 5]


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