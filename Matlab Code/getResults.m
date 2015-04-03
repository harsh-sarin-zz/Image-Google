function [result] = getResults(image_path,databasePath, category)
    %[FileName,imagePath] = uigetfile('*.*','Select the image file');
    image = imread(image_path);
    categories = cellstr(category);
    tic
    result = Classify(image,800);
    numOfCategories = size(result,2);
    matchedImagePaths = cell(1);

    imagesToDisplayIndex = 1;
    categoryPredictionIndex = 0;
    for index = 1:numOfCategories
        if(result(index) == 1)
            folderPath = fullfile(databasePath,categories(index),'*.jpg');
            categoryPredictionIndex = categoryPredictionIndex+1;
            categoryPrediction(categoryPredictionIndex) = categories(index);
            images = dir(char(folderPath));
            for imageIndex = 1:min(size(images,1),30)
                matchedImagePaths(imagesToDisplayIndex) = ...
                   cellstr(fullfile(databasePath,char(categories(index)),...
                   images(imageIndex).name));
                imagesToDisplayIndex = imagesToDisplayIndex + 1;
            end 
        end
    end
    if(categoryPredictionIndex ~= 0)
        msgbox({'Categories' char(categoryPrediction(:))},'Result');
        imdisp(matchedImagePaths);
    else
        msgbox('No Match Found','Result');
    end
end