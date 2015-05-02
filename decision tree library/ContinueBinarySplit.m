% Take a continueous value with the result return which split will produce minmimux Entropy
function [continuesplit, entropy, distribution] = ContinueBinarySplit(data1,result)
elements = size(data1,1);
JoinMatrix = sortrows([data1,result]);
split = 1;
entropy = 2;
distribution = [];
% calculate the maximum Entroy split value
for i = 1:elements-1
    a = sum(JoinMatrix(1:i,2))/i; % value 1 in first half
    b = sum(JoinMatrix(i+1:end,2))/(elements-i); % value 1 in second half
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
    if entropy > (i/elements)*ea + (1-(i/elements))*eb
        entropy = (i/elements)*ea + (1-(i/elements))*eb;
        split = i;
    end
    distribution = [distribution,(i/elements)*ea + (1-(i/elements))*eb]; %#ok<AGROW>
end
continuesplit = JoinMatrix(split,1);
end