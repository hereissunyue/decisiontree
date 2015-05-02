% Take the tree and return how many nodes in one certain layer
function [nodecount] = CountNode(Tree)
MaxLayer = size(Tree,2);
nodecount = zeros(1,MaxLayer);
for i =1:MaxLayer
    nodecount(i) = size(Tree{i},1);
end
end