%-----EVALUATE CLASSIFIER-----%

%create test data
testPredictions = struct;
testActual = struct;

for i=1:5
    testPredictions(i).image = vehicleTrainingImagesWithLabels(i).labelledImage.image;
    testActual(i).image = vehicleTrainingImagesWithLabels(i).labelledImage.image;
    testActual(i).label = vehicleTrainingImagesWithLabels(i).labelledImage.label;
end
testPredictions(1).label = 'truck';
testPredictions(2).label = 'ship';
testPredictions(3).label = 'automobile';
testPredictions(4).label = 'plane';
testPredictions(5).label = 'truck';