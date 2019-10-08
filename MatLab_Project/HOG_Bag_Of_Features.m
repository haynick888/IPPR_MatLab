%-----CREATE BAG OF FEATURES WITH HOG DESCRIPTORS-----%

%initialise variables
HOG_BagOfFeatures = struct;
BagOfFeaturesCounter = 1;

%for each image, apply HOG and add to bag of features struct
for thisAnyImage=1:numel(vehicleTrainingImagesWithLabels)
    [featureVector,hogVisualization] = extractHOGFeatures(vehicleTrainingImagesWithLabels(thisAnyImage).labelledImage.image, 'CellSize',[2 2]);
    HOG_BagOfFeatures(BagOfFeaturesCounter).featureVector = featureVector;
    HOG_BagOfFeatures(BagOfFeaturesCounter).hogVisualization = hogVisualization;
    HOG_BagOfFeatures(BagOfFeaturesCounter).label = vehicleTrainingImagesWithLabels(thisAnyImage).labelledImage.label;
    BagOfFeaturesCounter = BagOfFeaturesCounter + 1;
end

%replace 0 variance with tiny number
for hogBagofFeaturesIndeX=1:numel(HOG_BagOfFeatures)
   for featureVectorIndex=1:numel(HOG_BagOfFeatures(hogBagofFeaturesIndeX).featureVector)
      if  HOG_BagOfFeatures(hogBagofFeaturesIndeX).featureVector(featureVectorIndex) == 0
          HOG_BagOfFeatures(hogBagofFeaturesIndeX).featureVector(featureVectorIndex) = .0000001;
      end
   end
end