pathTestSet = '/Users/Harsh/Desktop/testset';
testCategories = dir(pathTestSet);
PredictionIndex = 1;
originalPrediction = cell(1);
for index = 1:size(testCategories,1)
    pathImagesInCategory = fullfile(pathTestSet,testCategories(index).name);
    if(testCategories(index).name(1) == '.')
            continue;
    end
    imagesInCategory = dir(pathImagesInCategory);
    for indexImageCount = 1:size(imagesInCategory,1)
        if(imagesInCategory(indexImageCount).name(1) == '.')
            continue;
        end    
        originalPrediction(PredictionIndex) = cellstr(testCategories(index).name);
        PredictionIndex = PredictionIndex +1;
    end    
end
integerPrediction(size(originalPrediction,2)) = zeros;
 cats = cellstr(categories);
for index1 = 1:size(originalPrediction,2)
    for indexCategory = 1:size(cats,1)
        z = char(originalPrediction(1,index1));
        y = char(cats(indexCategory,1));
        if(strcmp(z(1,:),y(1,:)))
            integerPrediction(index1) = indexCategory;
            break;
        end
    end    
end    

