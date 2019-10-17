%-----EVALUATE CLASSIFIER-----%

correctCount = 0;
inCorrectCount = 0;
falseLargeAsSmall = 0;
largeCount = 0;
for i=1:numel(predictions)
   if (predictions(i) == actuals(i))
       correctCount = correctCount + 1;
   else
       inCorrectCount = inCorrectCount + 1;
   end
   
   if (~(actuals(i) == "automobile"))
       largeCount = largeCount + 1;
      if (predictions(i) == "automobile")
          falseLargeAsSmall = falseLargeAsSmall + 1;
      end
   end
end

% truePos = sum((predictions == 'airplane') & (actuals == 'airplane')|(predictions == 'automobile') & (actuals == 'automobile')|(predictions == 'ship') & (actuals == 'ship')|(predictions == 'truck') & (actuals == 'truck'));
% falsePos = sum((predictions == 'airplane') & (actuals == 'automobile')|(predictions == 'airplane') & (actuals == 'ship')|(predictions == 'airplane') & (actuals == 'truck')|(predictions == 'automobile') & (actuals == 'airplane')|(predictions == 'automobile') & (actuals == 'ship')|(predictions == 'automobile') & (actuals == 'truck')|(predictions == 'ship') & (actuals == 'automobile')|(predictions == 'ship') & (actuals == 'airplane')|(predictions == 'ship') & (actuals == 'automobile')|(predictions == 'ship') & (actuals == 'truck')|(predictions == 'truck') & (actuals == 'automobile')|(predictions == 'truck') & (actuals == 'airplane')|(predictions == 'truck') & (actuals == 'ship'));
% falseNeg = sum((predictions == 'automobile') & (actuals == 'airplane')|(predictions == 'ship') & (actuals == 'airplane')|(predictions == 'truck') & (actuals == 'airplane')|(predictions == 'airplane') & (actuals == 'automobile')|(predictions == 'ship') & (actuals == 'automobile')|(predictions == 'truck') & (actuals == 'automobile')|(predictions == 'airplane') & (actuals == 'ship')|(predictions == 'automobile') & (actuals == 'ship')|(predictions == 'truck') & (actuals == 'ship')|(predictions == 'airplane') & (actuals == 'truck')|(predictions == 'automobile') & (actuals == 'truck')|(predictions == 'ship') & (actuals == 'truck'));
% trueNeg = numel(predictions) - (truePos + falsePos + falseNeg);

% precision = truePos / (truePos + falsePos);
% recall = truePos / (truePos + falseNeg);
% F1 = (2 * precision * recall) / (precision + recall);


accuracy = (correctCount/numel(predictions)) * 100;
falseSmallIdentificationRate = (falseLargeAsSmall/largeCount) * 100;

scoreInfo = sprintf(strcat("Confusion Chart of Vehicle Classification", "\n\n", "Accuracy: ", num2str(accuracy), "%%",  "\n", "False Large As Small Rate: ", num2str(falseSmallIdentificationRate), "%%"));

%display classification results in confusion matrix
figure('Name','Confusion Matrix');
nexttile
confusion = confusionchart(actuals, predictions);
confusion.RowSummary = 'row-normalized';
confusion.ColumnSummary = 'column-normalized';
confusion.Title = scoreInfo;
% title(scoreInfo);

% nexttile()
% textBox = annotation('textbox');
% textBox.String = scoreInfo;
% textBox.BackgroundColor = '#C0D890';
% textBox.FontWeight = 'bold';
% textBox.FontUnits = 'normalized';
% textBox.FontSize = .03;
% textBox.Position = [.25, .3, 0, 0];
% textBox.FitBoxToText = 'on';

%display example HOG
figure('Name','HOG Examples');
nexttile
randomIndex = randi([1, numel(allTestImagesWithLabels)],1);
randomImage = allTestImagesWithLabels(randomIndex).labelledImage;
imshow(randomImage.image);
title("HOG Example of " + randomImage.label);
hold on;
plot(BagOfFeatures(randomIndex).hogVisualization);

nexttile
randomIndex = randi([1, numel(allTestImagesWithLabels)],1);
randomImage = allTestImagesWithLabels(randomIndex).labelledImage;
imshow(randomImage.image);
title("HOG Example of " + randomImage.label);
hold on;
plot(BagOfFeatures(randomIndex).hogVisualization);

nexttile
randomIndex = randi([1, numel(allTestImagesWithLabels)],1);
randomImage = allTestImagesWithLabels(randomIndex).labelledImage;
imshow(randomImage.image);
title("HOG Example of " + randomImage.label);
hold on;
plot(BagOfFeatures(randomIndex).hogVisualization);

nexttile
randomIndex = randi([1, numel(allTestImagesWithLabels)],1);
randomImage = allTestImagesWithLabels(randomIndex).labelledImage;
imshow(randomImage.image);
title("HOG Example of " + randomImage.label);
hold on;
plot(BagOfFeatures(randomIndex).hogVisualization);