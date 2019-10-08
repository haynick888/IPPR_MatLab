%-----LOAD IMAGES FROM DATASET TO STRUCTURES-----%

%training size
batchesPerTest = 5;
indexPerTest = 10; %change this up to 10,000 depending on size of your test

%initialise variables
trainingBatches = {load('dataset/data_batch_1.mat'), load('dataset/data_batch_2.mat'), load('dataset/data_batch_3.mat'), load('dataset/data_batch_4.mat'), load('dataset/data_batch_5.mat')};
rgbChannels = {zeros(32, 32), zeros(32, 32), zeros(32, 32)};
testBatch = load('dataset/test_batch.mat');
labelDictionary = load('dataset/batches.meta.mat');
allTrainingImagesWithLabels = struct;
vehicleTrainingImagesWithLabels = struct;

%convert dataset image file format to uint8 image format and add to
%structure
for trainBatch=1:batchesPerTest
    for imageIndex = 1:indexPerTest
        %dataset has images sorted into 32*32 pixels * 3 colour channels
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
        %add label to each uint8 image
        allTrainingImagesWithLabels(currentIndex).labelledImage = currentImage;
    end
end

%extract only images labelled as a vehicle type as we are only training and
%testing with these
counter = 0;
for thisAnyImage=1:numel(allTrainingImagesWithLabels)
    currentLabel = allTrainingImagesWithLabels(thisAnyImage).labelledImage.label;
    if (currentLabel == "ship" || currentLabel == "automobile" || currentLabel == "truck" || currentLabel == "airplane")
        counter = counter+1;
        vehicleTrainingImagesWithLabels(counter).labelledImage = allTrainingImagesWithLabels(thisAnyImage).labelledImage;
    end
end