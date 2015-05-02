% Take the no missing data instance and the Tree structure and return the preict result
function [result] = TreePredict(instance, Tree)
result = 100;
layer = 1; % root node is layer 1
pointer = 1; % the first layer is root node only have one demand
while (result~=0 || result~=1)
    LayerMatrix = Tree{layer};
    spliting = LayerMatrix(pointer,:);
    splitattribute = spliting(1);
    splitvalue = spliting(2);
    if instance(splitattribute)<=splitvalue
        splitcheck = spliting(3);
        potentialpointer = spliting(4);
        potentialresult = spliting(5);
    else
        splitcheck = spliting(6);        
        potentialpointer = spliting(7);
        potentialresult = spliting(8);
    end
    
    % update the layer or reach leafnode
    if splitcheck~=1
        result = potentialresult;
        break
    else
        layer = layer+1;
        pointer = potentialpointer;
    end
end
end