% Take the tree and leaf node return the path from root node to leaf
function [conditionlist] = BackTrace(leaf, Tree)
conditionlist = zeros(leaf(1),3);
maxlayer = leaf(1);
pointer = leaf(2);
branch = leaf(3);
for i = maxlayer:-1:1
    nodeinfo = Tree{i}(pointer,:);
    conditionlist(i,1:2) = nodeinfo(1:2);
    conditionlist(i,3) = branch;
    % update the pointer
    if i~=1
        newlayer = Tree{i-1};
        if isempty(find(newlayer(:,4)==pointer, 1))
            pointer = find(newlayer(:,7)==pointer);
            branch = 2;
        else
            pointer = find(newlayer(:,4)==pointer, 1);
            branch = 1;
        end
    elseif i==1
        
    end
end
end