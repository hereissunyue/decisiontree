% Take the remaining instances of a node and return the entropy
function [entropy] = NodeEntropy(result)
elements = size(result,1);
sumone = sum(result);
if sumone == 0 || sumone == elements
    entropy = 0;
else
    P = sumone/elements;
    entropy = -(P*log2(P)+(1-P)*log2(1-P));
end
end