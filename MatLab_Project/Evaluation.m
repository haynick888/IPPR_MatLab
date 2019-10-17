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

precision = truePos / (truePos + falsePos);
recall = truePos / (truePos + falseNeg);
F1 = (2 * precision * recall) / (precision + recall);


accuracy = (correctCount/numel(predictions)) * 100;
falseSmallIdentificationRate = (falseLargeAsSmall/largeCount) * 100;

scoreInfo = sprintf(strcat("Accuracy:\n", num2str(accuracy), "%%",  "\n\n", "False Small As Large Rate:\n", num2str(falseSmallIdentificationRate), "%%"));

%display classification results in confusion matrix
confusion = confusionchart(actuals, predictions);
confusion.RowSummary = 'row-normalized';
confusion.ColumnSummary = 'column-normalized';
confusion.Title = 'Confusion Chart of Vehicle Classification';

textBox = annotation('textbox');
textBox.String = scoreInfo;
textBox.BackgroundColor = '#C0D890';
textBox.FontWeight = 'bold';
textBox.FontUnits = 'normalized';
textBox.FontSize = .03;
textBox.Position = [.67, .33, 0, 0];
textBox.FitBoxToText = 'on';
%annotation('textbox', [.8, 0, .8, .5], 'String', scoreInfo,'FitBoxToText','on');
