% Take the tree and return how many splits are there in the tree
function [splitnum] = PrunedTreeSplit(Tree, cutpoint, prunelayer)
layernum = size(Tree,2);
splitnum = 0;
for i = 1:layernum
    splitnum = splitnum + size(Tree{i},1);
end
% count the split below the cutpoint on that branch
cutsplits = cutpoint * (layernum - prunelayer)/2;
splitnum = splitnum - cutsplits;
end