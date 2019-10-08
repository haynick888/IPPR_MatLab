% HOG Practice
HOG_BagOfFeatures = struct;
BagOfFeaturesCounter = 1;
for thisAnyImage=1:numel(vehicleTrainingImagesWithLabels)
    [featureVector,hogVisualization] = extractHOGFeatures(vehicleTrainingImagesWithLabels(thisAnyImage).labelledImage.image, 'CellSize',[2 2]);
    HOG_BagOfFeatures(BagOfFeaturesCounter).featureVector = featureVector;
    HOG_BagOfFeatures(BagOfFeaturesCounter).hogVisualization = hogVisualization;
    BagOfFeaturesCounter = BagOfFeaturesCounter + 1;
end