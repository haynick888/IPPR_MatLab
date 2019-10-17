%-----LOAD IMAGES FROM DATASET TO STRUCTURES-----%

%initialise variables
trainingBatches = {load('dataset/data_batch_1.mat'), load('dataset/data_batch_2.mat'), load('dataset/data_batch_3.mat'), load('dataset/data_batch_4.mat'), load('dataset/data_batch_5.mat')};
rgbChannels = {zeros(32, 32), zeros(32, 32), zeros(32, 32)};
testBatch = load('dataset/test_batch.mat');
labelDictionary = load('dataset/batches.meta.mat');
allTrainingImagesWithLabels = struct;
allTestImagesWithLabels = struct;

%convert dataset image file format to uint8 image format and add to
%structure
trainCurrentIndex = 1;
for trainBatch=1:5
    if (ismember(trainBatch,useImageDataset))
        trainImageIndex = 1;
        indexPerTrain = numberOfTrainImages;
        while (trainImageIndex <= indexPerTrain) && (trainImageIndex < 10001)
            imageLabel = labelDictionary.label_names(trainingBatches{trainBatch}.labels(trainImageIndex)+1);
            if (imageLabel == "ship" || imageLabel == "automobile" || imageLabel == "truck" || imageLabel == "airplane")
                %dataset has images sorted into 32*32 pixels * 3 colour channels
                for rgbChannel=1:3
                    for row=1:32
                        for col=1:32
                            rgbChannels{rgbChannel}(row,col)=trainingBatches{trainBatch}.data(trainImageIndex,1024*(rgbChannel-1)+32*(row-1)+col);
                        end
                    end
                    rgbChannels{rgbChannel} = uint8(rgbChannels{rgbChannel});
                end
                currentImage(1).image = cat(3, rgbChannels{1}, rgbChannels{2}, rgbChannels{3});
                currentImage(1).label = imageLabel;
                %add label to each uint8 image
                allTrainingImagesWithLabels(trainCurrentIndex).labelledImage = currentImage;
                trainCurrentIndex = trainCurrentIndex + 1;
            else
                indexPerTrain = indexPerTrain + 1;
            end
            trainImageIndex = trainImageIndex + 1;
        end
    end
end

%------------------------------------------------------------------------%
%repeat for test images

%convert dataset image file format to uint8 image format and add to
%structure
testCurrentIndex = 1;
testImageIndex = 1;
while (testImageIndex <= numberOfTestImages) && (testImageIndex < 10001)
    imageLabel = labelDictionary.label_names(testBatch.labels(testImageIndex)+1);
    if (imageLabel == "ship" || imageLabel == "automobile" || imageLabel == "truck" || imageLabel == "airplane")
        for rgbChannel=1:3
            for row=1:32
                for col=1:32
                    rgbChannels{rgbChannel}(row,col)=testBatch.data(testImageIndex,1024*(rgbChannel-1)+32*(row-1)+col);
                end
            end
            rgbChannels{rgbChannel} = uint8(rgbChannels{rgbChannel});
        end
        currentImage(1).image = cat(3, rgbChannels{1}, rgbChannels{2}, rgbChannels{3});
        currentImage(1).label = imageLabel;
        %add label to each uint8 image
        allTestImagesWithLabels(testCurrentIndex).labelledImage = currentImage;
        testCurrentIndex = testCurrentIndex + 1;
    else
        numberOfTestImages = numberOfTestImages + 1;
    end
    testImageIndex = testImageIndex + 1;
end

%------------------------------------------------------------------------%
%clean up variables

clear testImageIndex;
clear trainImageIndex;
clear trainCurrentIndex;
clear indexPerTrain;
clear rgbChannel;
clear row;
clear col;
clear currentImage;
clear imageLabel;
clear rgbChannels;
clear numberOfTestImages;
clear trainBatch;
clear testCurrentIndex;
