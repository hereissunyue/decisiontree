% Take an data cell as input and output the NaN numbers for each cell in an array
function [NaNcount] = CountNaN(datacell)
cellnum = size(datacell,2);
NaNcount = zeros(cellnum,1);
for i = 1:cellnum
    NaNcount(i) = sum(isnan(datacell{i}));
end
end