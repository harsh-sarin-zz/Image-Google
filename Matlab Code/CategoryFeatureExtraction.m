function [ featureSet, trainingImageSet ] = CategoryFeatureExtraction( imageSetInfo )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
[unusedVar1, numOfSets] = size(imageSetInfo.description);
featureSet = struct('category',{},'feature',{});
trainingImageSet = struct('name',{},'category',{},'numOfFeatures',{},'bof',{});
indexImagesScanned = 0;
tic
for index = 1:numOfSets
    imageSet = struct('image',{},'points',{},'featureVectors',{},...
        'validPoints',{});
    filenames = dir(char(fullfile(imageSetInfo.path(index),'*.jpg')));
    for indexImage = 1:numel(filenames)
        full_name = fullfile(imageSetInfo.path(index), filenames(indexImage).name);
        inputImage = imread(char(full_name));
        if(size(inputImage,3) == 3)
            imageSet(indexImage).image = rgb2gray(inputImage);
        else
            imageSet(indexImage).image = inputImage;
        end
        imageSet(indexImage).points = ...
            detectSURFFeatures(imageSet(indexImage).image);
        [imageSet(indexImage).featureVectors, imageSet(indexImage).validPoints] = ...
            extractFeatures(imageSet(indexImage).image, imageSet(indexImage).points);
        indexImagesScanned = indexImagesScanned + 1;
        trainingImageSet(indexImagesScanned).name = filenames(indexImage).name;
        trainingImageSet(indexImagesScanned).category = imageSetInfo.description(index);
        trainingImageSet(indexImagesScanned).numOfFeatures = size(imageSet(indexImage).featureVectors,1);
    end
    featureSet(index).category = imageSetInfo.description(index);
    featureSet(index).feature = double(vertcat(imageSet.featureVectors));
end
toc
end

