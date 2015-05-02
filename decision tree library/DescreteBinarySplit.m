% Take a descrete attribute with the result return which split will produce minmimux Entropy
function [descretesplit, entropy, distribution] = DescreteBinarySplit(data,result)
elements = size(data,1);
JoinMatrix = sortrows([data,result]);
maxattribute = max(data);
minattribute = min(data);
split = 1;
entropy = 2;
distribution = [];
% calculate the maximum Entroy split value
for i = minattribute:maxattribute-1
    j = size(find(JoinMatrix(:,1)<=i),1);
    a = sum(JoinMatrix(1:j,2))/j; % value 1 in first half
    b = sum(JoinMatrix(j+1:end,2))/(elements-j); % value 1 in second half
    % calculate the entropy of each split
    if (a == 1 || a ==0)
        ea = 0;
    else
        ea = -(a*log2(a)+(1-a)*log2(1-a));
    end
    if (b == 1 || b == 0)
        eb = 0;
    else
        eb = -(b*log2(b)+(1-b)*log2(1-b));
    end
    % total entropy of the split
    if entropy > (j/elements)*ea + (1-(j/elements))*eb
        entropy = (j/elements)*ea + (1-(j/elements))*eb;
        split = i;
    end
    distribution = [distribution,(j/elements)*ea + (1-(j/elements))*eb]; %#ok<AGROW>
end
descretesplit = split;
end