% Take an data cell and NaN count as input and output the attribute average except NaN
function [Attributeavg] = Attriavg(datacell,NaNcount,Attritype)
cellnum = size(datacell,2);
Attributeavg = zeros(cellnum-1,1);
for i = 1:cellnum-1
    temp = datacell{i};
    temp(isnan(temp)) = 0;
    if Attritype(i)==1
        Attributeavg(i) = round(sum(temp)/ (size(temp,1)-NaNcount(i)));
    elseif Attritype(i)==0
        Attributeavg(i) = sum(temp)/ (size(temp,1)-NaNcount(i));
    end
end
end