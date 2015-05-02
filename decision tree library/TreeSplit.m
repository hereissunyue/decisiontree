% Take the tree and return how many splits are there in the tree
function [splitnum] = TreeSplit(Tree)
layernum = size(Tree,2);
splitnum = 0;
for i = 1:layernum
    splitnum = splitnum + size(Tree{i},1);
end
end