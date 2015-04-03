function histogram_compare(im_path)
    % Load comparison image
    %im = imread(strcat(path, dirs(31).name));
    load('histogram_compare');
    
    im = imread(im_path);
    r = zeros(size(hists,4),1);
    
    % Without indexing, this is very slow; can index by clustering,
    % choosing choosing a representative image for each cluster
    % Cluster by testing each image against every other image
    % Maximize the sum of (sum of scores in each category)

     % For each histogram stored
    for c = 1:3  % Test each color
        ims = quadtree(im(:,:, c), 2);
        for i = 1:size(hists, 4)
            for seg = 1:size(ims,1) % Test each segment
                [im_hist, locations] = imhist(ims{seg});
                a = xcorr(hists(:,seg,c,i), im_hist, 0);
                r(i) = r(i) + a;
            end
        end
    end

    % Display image w/ highest correlation
    [m, i] = max(r);
    imshow(db(:,:,:,i));

    % Display images ordered by correlation
    [rs, is] = sort(r, 'descend');
    s_ims = db(:,:,:,is);
    figure;
    for i = 1:16
        subplot(4,4,i), imshow(s_ims(:,:,:,i));
    end

end