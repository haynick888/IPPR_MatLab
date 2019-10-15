%-----BAYES CLASSIFIER-----%

%initialise variables
bagOfFeaturesVectors = vertcat(HOG_BagOfFeatures(:).featureVector);
bagOfFeaturesLabels = vertcat(HOG_BagOfFeatures(:).label);

%create and train Bayes model
BayesModel = fitcnb(bagOfFeaturesVectors,bagOfFeaturesLabels);

%create lists of predicted and actual labels for comparison
predictions = string(numel(HOG_BagOfFeaturesTestImages));
actuals = string(numel(HOG_BagOfFeaturesTestImages));
for i=1:numel(HOG_BagOfFeaturesTestImages)
    [predictedLabel,score] = predict(BayesModel, HOG_BagOfFeaturesTestImages(i).featureVector);
    predictions(i) = predictedLabel;
    actuals(i) = HOG_BagOfFeaturesTestImages(i).label;
end

%display classification results in confusion matrix
confusionchart(actuals, predictions)

clear featureVectorIndex;
clear i;
clear score;
clear predictedLabel;