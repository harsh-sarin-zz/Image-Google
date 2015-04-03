% Load images
function histogram_prepare(path)

    dirs = dir(fullfile(path,'*.jpg'));
    %db = 0;
    for i = 1:size(dirs,1)
        a = imread(fullfile(path, dirs(i).name));
        if (i > 1)
            db(:,:,:,i) = imresize(a, s(1:2));
        else
            db = zeros(size(a,1),size(a,2),3,size(dirs,1),'uint8');
            s = size(a);
            db(:,:,:,i) = a;
        end
    end


    % Find histogram for each
    hists = [];
    for c = 1:3
        for i = 1:size(dirs,1)
            ims = quadtree(db(:,:, c, i), 2);
            
            for seg = 1:size(ims,1)
                [counts, locations] = imhist(ims{seg});
                hists(:,seg,c,i) = counts;
            end
        end
    end

    % Can store and run from this point if necessary
    save('histogram_compare','hists','db');

end
