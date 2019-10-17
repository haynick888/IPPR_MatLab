%-----PRACTICE RANGE TO TEST AND VIEW PROGRESS-----%

% % %load test image
% % testImageIndex = randi([1 numel(vehicleTrainingImagesWithLabels)]);
% % testImage = vehicleTrainingImagesWithLabels(testImageIndex).labelledImage;
% % 
% %preview image with descriptors
% % imshow(allTestImagesWithLabels(1).labelledImage.image);
% % title("HOG: " + testImage.label);
% % hold on;
% % plot(BagOfFeatures(1).hogVisualization);
% 
% 
% 
% x = struct;
% e = zeros();
% 
% l = ["ship", "truck", "automobile", "airplane"];
% 
% for i=1:10
%    x(i).eccentricity = size(regionprops(allTestImagesWithLabels(i).labelledImage.image, 'centroid'));
%    [a,b] = size(x(i).eccentricity);
%    x(i).e = a;
%    x(i).r = rand(1) * 200;
%    x(i).l = allTestImagesWithLabels(i).labelledImage.label;
% end
% 
% %plot (scores(class1,2), scores(class1,3),'.r','markersize', 20);
% 
% y = [x.l];
% 
% plot([x.e]);
% set(gca,'xticklabel',y.')