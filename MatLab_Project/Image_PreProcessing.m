%-----Image Pre-Processing-----%

% Reads the given image %
imageToProcess = currentImageBeingProcessed;
%%%HOGImage = currentImageBeingProcessed;

% Sharpens the truecolor RGB image %
sharpenedImage = imsharpen(imageToProcess);

%%%HOGImage = sharpenedImage;

% Converts the RGB iamge to greyscale %
greyImage = rgb2gray(sharpenedImage);

% Erosion of the image %
SE  = strel('Disk',1,8);
morphologicalGradient = imsubtract(imdilate(greyImage, SE),imerode(greyImage, SE));

% Seperates the foreground and background of the image %
mask = imbinarize(morphologicalGradient,0.025);
SE  = strel('Disk',3,4);

% Masks the background %
mask = imclose(mask, SE);
mask = imfill(mask,'holes');
mask = bwareafilt(mask,1);
notMask = ~mask;
mask = mask | bwpropfilt(notMask,'Area',[-Inf, 5000 - eps(5000)]);

newGreyImage = rgb2gray(sharpenedImage);
newGreyImage(~mask) = 255;

ColourExtractorImage = sharpenedImage;

% Splits the RGB to mask each plane of color %
r = sharpenedImage(:,:,1);
g = sharpenedImage(:,:,2);
b = sharpenedImage(:,:,3);
r(~mask) = 255;
g(~mask) = 255;
b(~mask) = 255;

% Reconstructs the RGB image% 
reSharpenedImage = cat(3,r,g,b);

HOGImage = reSharpenedImage;

% Gaussian Filter for the image %
greyReSharpenedImage = rgb2gray(reSharpenedImage);
Iblur = imgaussfilt(reSharpenedImage,1);

% Halfway point comparison of the original image and the new image % 
%%montage({sharpenedImage,Iblur})

% Flips the binary color so the background is white and the edges are black
F = imbinarize(greyReSharpenedImage,'adaptive','ForegroundPolarity','dark','Sensitivity',0.2);

%The object that needs to be segmented differs greatly in contrast to the
%image, changes in contrast can be detected by operators that calcualte the
%gradient of an image %
[~,threshold] = edge(F,'sobel');
fudgeFactor = 0.4;
BWs = edge(greyReSharpenedImage,'sobel',threshold * fudgeFactor);

EccentricityImage = BWs;

% Morphological structuring for binary, creates a linear structure that is
% symmetric with respect to the neighbourhood centre with approiximate
% length (len), and angle (deg)
se90 = strel('line',3,90);
se0 = strel('line',3,0);

% Dilates the greyscale and returns the dialted image in high contrast %
BWsdil = imdilate(BWs,[se90 se0]);

%Removes all connected components (objects) that have fewer pixels than 250
% from the binary image to produce another bainry image
BW2 = bwareaopen(BWsdil, 250);

% Any objects in the foreground or background connected to the border are
% removed
BWnobord = imclearborder(BW2,1);
%%imshow(BWnobord)
%%title('Cleared Border Image')

% Reduces the thickness of the outline to enhance the quality of the
% figures
thinedImage = bwmorph(BWnobord,'thin',inf);
%%imshow(BWnobord)


%Smoothing the object by erodingt he image once with a diamond structuring
%element
seD = strel('diamond',1);
BWfinal = imerode(BWnobord,seD);
%%imshow(BWfinal)
%%title('Segmented Image');

%Shows connected componenets data and tells us the number of objects in the
%image %
NumObjectsImage = bwconncomp(BWnobord);

