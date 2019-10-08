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

%extract dataset from .tar.gz file
Extract_Dataset

%loads images from dataset into readable images with corresponding labels
Load_Images

%creates a bag of features for each vehicle training image using the HOG
%feature detector
HOG_Bag_Of_Features

%run practice script
Practice_Range