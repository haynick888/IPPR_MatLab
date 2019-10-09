%-----CREATE BAG OF FEATURES WITH HOG DESCRIPTORS-----%

%initialise variables
HOG_BagOfFeatures = struct;
HOG_BagOfFeaturesTestImages = struct;
BagOfFeaturesCounter = 1;
BagOfFeaturesCounterTestImages = 1;

%for each image, apply HOG and add to bag of features struct
for thisAnyImage=1:numel(vehicleTrainingImagesWithLabels)
    [featureVector,hogVisualization] = extractHOGFeatures(vehicleTrainingImagesWithLabels(thisAnyImage).labelledImage.image, 'CellSize',[4 4]);
    HOG_BagOfFeatures(BagOfFeaturesCounter).featureVector = featureVector;
    HOG_BagOfFeatures(BagOfFeaturesCounter).hogVisualization = hogVisualization;
    HOG_BagOfFeatures(BagOfFeaturesCounter).label = vehicleTrainingImagesWithLabels(thisAnyImage).labelledImage.label;
    BagOfFeaturesCounter = BagOfFeaturesCounter + 1;
end

%replace 0 variance with tiny number
for hogBagofFeaturesIndex=1:numel(HOG_BagOfFeatures)
   for featureVectorIndex=1:numel(HOG_BagOfFeatures(hogBagofFeaturesIndex).featureVector)
      if  HOG_BagOfFeatures(hogBagofFeaturesIndex).featureVector(featureVectorIndex) == 0
          HOG_BagOfFeatures(hogBagofFeaturesIndex).featureVector(featureVectorIndex) = 0.0001;
      end
   end
end

%repeat above process for test images
for thisTestImage=1:numel(vehicleTestImagesWithLabels)
    [featureVectorTestImages,hogVisualizationTestImages] = extractHOGFeatures(vehicleTestImagesWithLabels(thisTestImage).labelledImage.image, 'CellSize',[4 4]);
    HOG_BagOfFeaturesTestImages(BagOfFeaturesCounterTestImages).featureVector = featureVectorTestImages;
    HOG_BagOfFeaturesTestImages(BagOfFeaturesCounterTestImages).hogVisualization = hogVisualizationTestImages;
    HOG_BagOfFeaturesTestImages(BagOfFeaturesCounterTestImages).label = vehicleTestImagesWithLabels(thisTestImage).labelledImage.label;
    HOG_BagOfFeaturesTestImages(BagOfFeaturesCounterTestImages).image = vehicleTestImagesWithLabels(thisTestImage).labelledImage.image;
    BagOfFeaturesCounterTestImages = BagOfFeaturesCounterTestImages + 1;
end