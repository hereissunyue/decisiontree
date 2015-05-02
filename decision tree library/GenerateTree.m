% Take root node instances and the attritpe return the tree in cell
function [Tree, Leaflist] = GenerateTree(rootdata,Attritype)
demand = 1; % demmand is the flag to decide whether we need one more layer
% demmand is 1 because we know we only have one root node
layer = 1; % start from layer 1, which corresponds to the tree cell number {layer}
remainingdata = {rootdata}; % befor we process the root node, there are one group of instances
errorentropy = 0.1; % entropy for a leaf node
Tree = {};
Leafnum = 1;
Leaflist = []; % storing the Leaflist for pruning and diaplaying
while demand~=0
    newdemand = 0;
    newremainingdata = {};
    newsplit = [];
    pointer = 1;
    for i = 1:demand
        tempdata = remainingdata{i};
        % calculate the split for such group of instances
        [tempdatacell1, tempdatacell2, tempsplitvalue, tempsplitattribute] = Spliting(tempdata,Attritype);
        % store the split status for tree
        newsplit(i,:)=[tempsplitattribute, tempsplitvalue, 0, 0, 0, 0, 0, 0]; %#ok<AGROW>
        % check whether the two groups are already fulfill our leaf node requirement
        [tempentropy1] = NodeEntropy(tempdatacell1{end});
        if tempentropy1 > errorentropy % split is needed
            newdemand = newdemand+1;
            newremainingdata{pointer} =  tempdatacell1; %#ok<AGROW>
            newsplit(i,3) = 1; %#ok<AGROW> % in next layer this brance have demand
            newsplit(i,4) = pointer; %#ok<AGROW> % in next layer location of the brance
            pointer = pointer+1;
        else % leaf node
            newsplit(i,5) = Leafvalue(tempdatacell1{end}); %#ok<AGROW> % the result of the leaf node
            Leaflist(Leafnum,:) = [layer, i, 1]; %#ok<AGROW> % storing the Leaflist for pruning and diaplaying
            Leafnum = Leafnum +1;
        end
        [tempentropy2] = NodeEntropy(tempdatacell2{end});
        if tempentropy2 > errorentropy
            newdemand = newdemand+1;
            newremainingdata{pointer} =  tempdatacell2; %#ok<AGROW>
            newsplit(i,6) = 1; %#ok<AGROW> % in next layer this brance have demand
            newsplit(i,7) = pointer; %#ok<AGROW> % in next layer location of the brance
            pointer = pointer+1;
        else
            newsplit(i,8) = Leafvalue(tempdatacell2{end}); %#ok<AGROW> % the result of the leaf node
            Leaflist(Leafnum,:) = [layer, i, 2]; %#ok<AGROW> % storing the Leaflist for pruning and diaplaying
            Leafnum = Leafnum +1;
        end
    end
    % Update the Tree
    Tree{layer} = newsplit;     %#ok<AGROW>
    if newdemand~=0
        layer = layer+1;
    end
    %layer
    demand = newdemand;
    remainingdata = newremainingdata;
end
end