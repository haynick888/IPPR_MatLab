%-----HOG DESCRIPTORS-----%

[featureVector,hogVisualization] = extractHOGFeatures(HOGImage, 'CellSize',[4 4]);

for featureVectorIndex=1:numel(featureVector)
      if  featureVector(featureVectorIndex) == 0
          featureVector(featureVectorIndex) = 0.0000000001;
      end
end