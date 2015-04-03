% Gets category array from results matrix
% actual = array of actual category for each image
function [results_array] = compressResultsMatrix(results, actual)

	categories = unique(actual);
	results_array = zeros(size(results,1),1);
	for i = 1:size(results,1)
		binary_cats = (categories == actual(i));
        temp = find(binary_cats);
		actualCat = temp(1); % get the index of the actual category (index in categories)

		% Found actual result! (doesn't matter if we have other results as well)
		if results(i,actualCat) == 1
			results_array(i) = actualCat;
		else
			I = find(results(i,:));
			if size(I,2) > 0		% Found some other result! (doesn't matter if there are others)
				disp(I)
				results_array(i) = I(1);
			else
				results_array(i) = NaN(1);
			end
		end
	end
end