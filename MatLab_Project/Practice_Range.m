%-----PRACTICE RANGE TO TEST AND VIEW PROGRESS-----%

%load test image
testImageIndex = randi([1 numel(vehicleTrainingImagesWithLabels)]);
testImage = vehicleTrainingImagesWithLabels(testImageIndex).labelledImage;

%preview image with descriptors
imshow(testImage.image);
title("HOG: " + testImage.label);
hold on;
plot(HOG_BagOfFeatures(testImageIndex).hogVisualization);