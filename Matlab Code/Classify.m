% Fitting / classification:
% Make histogram feature vector for the input image:
function [label] = Classify(inputImage, k)

	% Get the K-Means centroid locations (or the KD-tree object)
    load('KD');
	load('SVM'); 

	if(size(inputImage,3) == 3)
        image = rgb2gray(inputImage);
	else
	    image = inputImage;
	end
	points = detectSURFFeatures(image);
	[features, valid_points] = extractFeatures(image, points);

	% Make histogram for this image
	% For each figure, find the closest centroid
	centroidIndices = knnsearch(kd, features);
    originalIndices = centroidIndices;
	centroidIndices = sort(centroidIndices);
    
    histogram = zeros(1,k);
	totalSurfFeatures = size(features, 1); % Total SURF features for that image 
	tableIndex = 1;
    
%     mostNumOfWords = 0;
%     indexMostNumOfWords = 0;
	for j = 1:k
		numWords = 0;
		while ((tableIndex <= size(centroidIndices,1)) && (j == centroidIndices(tableIndex)))
			tableIndex = tableIndex + 1;
			numWords = numWords + 1;
		end
		histogram(j) = numWords / totalSurfFeatures;
%         if(histogram(j) > mostNumOfWords)
%             mostNumOfWords = histogram(j);
%             indexMostNumOfWords = j;
%         end    
    end
%     featureVect = struct('featurePoints',{});
%     featureVectIndex = 1;
%     for index = 1:size(originalIndices,1)
%         if(originalIndices(index) == indexMostNumOfWords)
%             featureVect(featureVectIndex).featurePoints = points(index);
%             featureVectIndex = featureVectIndex + 1;        
%         end    
%     end
%     figure(1);
%     imshow(inputImage); hold on;
%     for ind = 1:size(featureVect,2)
%         plot(featureVect(ind).featurePoints);
%     end
%     hold off;
%     figure(2);
%     imshow(inputImage); hold on;
%     plot(points);
%     hold off;
    
    label(size(models,2)) = zeros;
	for index=1:size(models, 2)
        label(index) = svmclassify(models(index),histogram);
    end
end
