trainingBatches = {load('dataset/data_batch_1.mat'), load('dataset/data_batch_2.mat'), load('dataset/data_batch_3.mat'), load('dataset/data_batch_4.mat'), load('dataset/data_batch_5.mat')};
rgbChannels = {zeros(32, 32), zeros(32, 32), zeros(32, 32)};

testBatch = load('dataset/test_batch.mat');
labelDictionary = load('dataset/batches.meta.mat');

allTrainingImagesWithLabels = struct;
vehicleTrainingImagesWithLabels = struct;

batchesPerTest = 5; % up to 5
indexPerTest = 100; % up to 10000

for trainBatch=1:batchesPerTest
    for imageIndex = 1:indexPerTest
        for rgbChannel=1:3
            for row=1:32
                for col=1:32
                    rgbChannels{rgbChannel}(row,col)=trainingBatches{trainBatch}.data(imageIndex,1024*(rgbChannel-1)+32*(row-1)+col);
                end
            end
            rgbChannels{rgbChannel} = uint8(rgbChannels{rgbChannel});
        end
        currentImage(1).image = cat(3, rgbChannels{1}, rgbChannels{2}, rgbChannels{3});
        currentImage(1).label = labelDictionary.label_names(trainingBatches{trainBatch}.labels(imageIndex)+1);
        currentIndex = imageIndex + (indexPerTest*(trainBatch-1));
        allTrainingImagesWithLabels(currentIndex).labelledImage = currentImage;
    end
end

counter = 0;
for thisAnyImage=1:numel(allTrainingImagesWithLabels)
    currentLabel = allTrainingImagesWithLabels(thisAnyImage).labelledImage.label;
    if (currentLabel == "ship" || currentLabel == "automobile" || currentLabel == "truck" || currentLabel == "airplane")
        counter = counter+1;
        vehicleTrainingImagesWithLabels(counter).labelledImage = allTrainingImagesWithLabels(thisAnyImage).labelledImage;
    end
end