classdef TrainingSet
    properties(SetAccess = private)
       description = cell(1);
       path = cell(1);
       count = 0;
    end
    
    methods
        function imgset = TrainingSet(path, categories)
            [numOfCategories, unusedVar1] = size(categories);
            for index = 1:numOfCategories
                imgset.description(index) = categories(index);
                imgset.path(index) = fullfile(path,categories(index));
                completePath = fullfile(imgset.path(index),'*.jpg');
                directoryInfo = dir(char(completePath));
                imgset.count(index) = length(directoryInfo);
            end    
        end
    end
    
end

