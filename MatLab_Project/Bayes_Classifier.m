%-----BAYES CLASSIFIER-----%

%initialise training variables
bagOfFeaturesLabels = vertcat(BagOfFeatures(:).label);

bagOfFeaturesFinal = zeros(numel(bagOfFeaturesLabels), 1);
if (ismember("eccentricity",useMethods))
    bagOfFeaturesEccentricity = vertcat(BagOfFeatures(:).eccentricity);
    bagOfFeaturesFinal = horzcat(bagOfFeaturesFinal, bagOfFeaturesEccentricity);
end
if (ismember("colours",useMethods))
    bagOfFeaturesColours= vertcat(BagOfFeatures(:).colourOccurences);
    bagOfFeaturesFinal = horzcat(bagOfFeaturesFinal, bagOfFeaturesColours);
end
if (ismember("hog",useMethods))
    bagOfFeaturesVectors = vertcat(BagOfFeatures(:).featureVector);
    bagOfFeaturesFinal = horzcat(bagOfFeaturesFinal, bagOfFeaturesVectors);
end
if (ismember("numObjects", useMethods))
    bagOfFeaturesNumObjects = vertcat(BagOfFeatures(:).numOfObjects);
    bagOfFeaturesFinal = horzcat(bagOfFeaturesFinal, bagOfFeaturesNumObjects);
end
bagOfFeaturesFinal(:, 1) = [];

%initialise testing variables
bagOfFeaturesTestLabels = vertcat(BagOfFeaturesTestImages(:).label);

bagOfFeaturesTestFinal = zeros(numel(bagOfFeaturesTestLabels), 1);
if (ismember("eccentricity",useMethods))
    bagOfFeaturesTestEccentricity = vertcat(BagOfFeaturesTestImages(:).eccentricity);
    bagOfFeaturesTestFinal = horzcat(bagOfFeaturesTestFinal, bagOfFeaturesTestEccentricity);
end
if (ismember("colours",useMethods))
    bagOfFeaturesTestColours= vertcat(BagOfFeaturesTestImages(:).colourOccurences);
    bagOfFeaturesTestFinal = horzcat(bagOfFeaturesTestFinal, bagOfFeaturesTestColours);
end
if (ismember("hog",useMethods))
    bagOfFeaturesTestVectors = vertcat(BagOfFeaturesTestImages(:).featureVector);
    bagOfFeaturesTestFinal = horzcat(bagOfFeaturesTestFinal, bagOfFeaturesTestVectors);
end
if (ismember("numObjects", useMethods))
    bagOfFeaturesTestNumObjects = vertcat(BagOfFeaturesTestImages(:).numOfObjects);
    bagOfFeaturesTestFinal = horzcat(bagOfFeaturesTestFinal, bagOfFeaturesTestNumObjects);
end
bagOfFeaturesTestFinal(:, 1) = [];

%create and train Bayes model
BayesModel = fitcnb(bagOfFeaturesFinal, bagOfFeaturesLabels, 'ClassNames', {'airplane', 'ship', 'truck', 'automobile'});

%apply costs of misclassification
BayesModel.Cost = [0 .02 .4 .4; .02 0 .4 .4; 0.02 0.02 0 0.02; 0.02 0.02 0.02 0];

%create lists of predicted and actual labels for comparison
predictions = string();
actuals = string();

[predictedLabel,score,cost] = predict(BayesModel, bagOfFeaturesTestFinal);
for i=1:numel(BagOfFeaturesTestImages)
    predictions(i) = predictedLabel(i);
    actuals(i) = bagOfFeaturesTestLabels(i);
end

clear featureVectorIndex;
clear i;
clear score;
clear predictedLabel;