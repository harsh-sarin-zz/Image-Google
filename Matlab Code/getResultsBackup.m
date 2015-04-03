function [results] = getResultsBackup(path, category)
    categories = cellstr(category);
	results = [];
	for directory = 1:size(categories, 1)
		testImages = fullfile(path,char(categories(directory)),'*.jpg');
        cat_dir = dir(testImages);
		for im = 1:size(cat_dir,1)
			image = imread(fullfile(path,char(categories(directory)),cat_dir(im).name));
            results = cat(1, results, Classify(image,800));
		end
	end
end