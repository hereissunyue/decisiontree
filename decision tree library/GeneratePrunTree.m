% Take the tree and return how many nodes in one certain layer
function [PurnedTree, newaccuracy, cutpoint] = GeneratePrunTree(Tree, prunelayer, Attritype, ValidateDataRaw)
testnum = size(Tree{prunelayer});
record = 0; % accuracy record
for i = 1:testnum
    currentbranch = Tree{prunelayer}(i,:);
    tempTree = Tree;
    if currentbranch(4)~=0
        tempTree{prunelayer}(i,3:5)=[0,0,1];
    elseif currentbranch(6)~=0
        tempTree{prunelayer}(i,6:8)=[0,0,0];
    end 
    [tempaccuracy] = Accuracy(tempTree, ValidateDataRaw, Attritype, 1, 1);
    if tempaccuracy > record
        PurnedTree = tempTree;
        newaccuracy = tempaccuracy;
        cutpoint = i;
    end
end
end