%-----EVALUATE CLASSIFIER-----%

%create practice data
testPredictions = struct;
testActual = struct;

for i=1:5
    testPredictions(i).image = allTrainingImagesWithLabels(i).labelledImage.image;
    testActual(i).image = allTrainingImagesWithLabels(i).labelledImage.image;
    testActual(i).label = allTrainingImagesWithLabels(i).labelledImage.label;
end
testPredictions(1).label = 'truck';
testPredictions(2).label = 'ship';
testPredictions(3).label = 'automobile';
testPredictions(4).label = 'plane';
testPredictions(5).label = 'truck';

clear i;