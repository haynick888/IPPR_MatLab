%-----CREATE BAG OF FEATURES-----%

%initialise variables
BagOfFeatures = struct;
BagOfFeaturesTestImages = struct;
BagOfFeaturesCounter = 1;
BagOfFeaturesCounterTestImages = 1;

for thisAnyImage=1:numel(allTrainingImagesWithLabels)
    currentImageBeingProcessed = allTrainingImagesWithLabels(thisAnyImage).labelledImage.image;
    Image_PreProcessing;
        BagOfFeatures(BagOfFeaturesCounter).numOfObjects = NumObjectsImage.NumObjects;
    HOG_Descriptors; %adds hog descriptors to bag of features
        BagOfFeatures(BagOfFeaturesCounter).featureVector = featureVector;
        BagOfFeatures(BagOfFeaturesCounter).hogVisualization = hogVisualization;
    Eccentricity; %adds eccentricity value to bag of features
        BagOfFeatures(BagOfFeaturesCounter).eccentricity = eccentricity;
    Colour_Counter;
        BagOfFeatures(BagOfFeaturesCounter).colourOccurences = colourOccurences;
    BagOfFeatures(BagOfFeaturesCounter).label = allTrainingImagesWithLabels(thisAnyImage).labelledImage.label;
    BagOfFeaturesCounter = BagOfFeaturesCounter + 1;
end
clear hogBagofFeaturesIndex;

%------------------------------------------------------------------------%
%repeat for test images

for thisTestImage=1:numel(allTestImagesWithLabels)
    currentImageBeingProcessed = allTestImagesWithLabels(thisTestImage).labelledImage.image;
    Image_PreProcessing;
        BagOfFeaturesTestImages(BagOfFeaturesCounterTestImages).numOfObjects = NumObjectsImage.NumObjects;
    HOG_Descriptors; %adds hog descriptors to bag of features
        BagOfFeaturesTestImages(BagOfFeaturesCounterTestImages).featureVector = featureVector;
        BagOfFeaturesTestImages(BagOfFeaturesCounterTestImages).hogVisualization = hogVisualization;
    Eccentricity; %adds eccentricity value to bag of features
        BagOfFeaturesTestImages(BagOfFeaturesCounterTestImages).eccentricity = eccentricity;
    Colour_Counter;
        BagOfFeaturesTestImages(BagOfFeaturesCounterTestImages).colourOccurences = colourOccurences;
    BagOfFeaturesTestImages(BagOfFeaturesCounterTestImages).label = allTestImagesWithLabels(thisTestImage).labelledImage.label;
    BagOfFeaturesTestImages(BagOfFeaturesCounterTestImages).image = allTestImagesWithLabels(thisTestImage).labelledImage.image;
    BagOfFeaturesCounterTestImages = BagOfFeaturesCounterTestImages + 1;
end

%------------------------------------------------------------------------%
%clean up variables

clear BagofFeaturesCounter;
clear BagofFeaturesCounterTestImages;
clear thisAnyImage;
clear thisTestImage;
clear featureVector;
clear featureVectorTestImages;