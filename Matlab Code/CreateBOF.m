function [ trainingImageSetInfo ] = CreateBOF( trainingImageSetInfo, clusterInfo,centroidInfo )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
k = size(centroidInfo,1);
lenghtTrainingImageSet = size(trainingImageSetInfo,2);
indexTrainingImageSet = 1;
indexClusterTable = 1;
histo(k) = zeros;

while indexClusterTable <= size(clusterInfo,1)
     if indexTrainingImageSet <= lenghtTrainingImageSet  
        rowsToScan = trainingImageSetInfo(indexTrainingImageSet).numOfFeatures;
        while rowsToScan ~= 0
            index = clusterInfo(indexClusterTable);
            histo(index) = histo(index) + 1;
            rowsToScan = rowsToScan -1;
            indexClusterTable = indexClusterTable + 1;
        end
        histo = NormalizeHisto(histo, trainingImageSetInfo(indexTrainingImageSet).numOfFeatures);
        trainingImageSetInfo(indexTrainingImageSet).bof = histo;
        histo(k) = zeros;
        indexTrainingImageSet = indexTrainingImageSet+1;
     else
         break;
     end    
end    
end

function [histo] = NormalizeHisto(histo, totalFeatures)
    numOfBins = size(histo,2);
    for index = 1:numOfBins
        histo(index) = histo(index)/totalFeatures;
    end    
end
