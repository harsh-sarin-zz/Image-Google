function images = quadtree(im, depth)
    % flatten (see if this works)
    images = quadtreeRecursive(im, depth);
    %index = 
     while iscell(images{1})
          images=[images{:}];
     end
end

function images = quadtreeRecursive(im, depth)
    if depth <= 0
        images = im;
    else
        images = cell(4,1);
        xlow = 1;
        for x = 1:2
            xhigh = x * size(im, 1) / 2;
            ylow = 1;
            for y = 1:2
                yhigh = y * size(im, 2) / 2;        
                images{(x-1) * 2 + y} = quadtreeRecursive(im(xlow:xhigh,ylow:yhigh), depth - 1);
                ylow = yhigh + 1;
            end
            xlow = xhigh + 1;
        end
    end
end
