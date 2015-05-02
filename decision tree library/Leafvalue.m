% Take the result of the remaining leaf node and trurn the result
function [leafvalue] = Leafvalue(result)
elements = size(result,1);
sumone = sum(result);
if sumone > elements/2
    leafvalue = 1;
else
    leafvalue = 0;
end
end