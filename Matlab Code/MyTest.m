function [features, idx, centroid, bagOfFeatures ] = MyTest( input1 )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
if(size(input1,3) == 3)
    image = rgb2gray(input1);
else
    image = input1;
end
points = detectSURFFeatures(image);
[features, valid_points] = extractFeatures(image, points);
figure; imshow(image); hold on;
plot(valid_points.selectStrongest(20),'showOrientation',true);
hold off;
k = 10;
[idx, centroid] = kmeans(features, k);
bagOfFeatures(k) = zeros;
for index = 1:size(idx,1)
    indexBagOfFeature = idx(index);
    bagOfFeatures(indexBagOfFeature) = bagOfFeatures(indexBagOfFeature) +1;
end

for index = 1:k
    bagOfFeatures(index) = bagOfFeatures(index)/size(idx,1);
end    
numOfFeatures = size(features, 1);
figure; hist(idx, k);
%figure; hist(bagOfFeatures,k);

% if(size(input2,3) == 3)
%     image = rgb2gray(input2);
% else
%     image = input2;
% end
% points = detectSURFFeatures(image);
% [features, valid_points] = extractFeatures(image, points);
% figure; imshow(image); hold on;
% plot(valid_points.selectStrongest(20),'showOrientation',true);
% hold off;
% k = 10;
% idx = kmeans(features, k);
% figure; hist(idx, k);
% 
% if(size(input3,3) == 3)
%     image = rgb2gray(input3);
% else
%     image = input3;
% end
% points = detectSURFFeatures(image);
% [features, valid_points] = extractFeatures(image, points);
% figure; imshow(image); hold on;
% plot(valid_points.selectStrongest(20),'showOrientation',true);
% hold off;
% k = 10;
% idx = kmeans(features, k);
% figure; hist(idx, k);
end

