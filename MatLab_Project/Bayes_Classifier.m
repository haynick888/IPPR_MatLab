%-----BAYES CLASSIFIER-----%

bagOfFeaturesVectors = vertcat(HOG_BagOfFeatures(:).featureVector);
bagOfFeaturesLabels = vertcat(HOG_BagOfFeatures(:).label);
Mdl = fitcnb(bagOfFeaturesVectors,bagOfFeaturesLabels);
% [predictedLabel,score] = predict(HOG_BagOfFeatures,featureVector);
% predictedLabel

[predictedLabel,score] = predict(Mdl, HOG_BagOfFeatures(1).featureVector)
