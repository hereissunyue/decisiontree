% Take an raw data cell and attribute average as input and output an pure
% real training data and predicted training data
function [TrainData] = GenerateData(datacell,Attributeavg, Attritype)
cellnum = size(datacell,2);
TrainData = datacell;
% replace the average data
for i = 1:cellnum-1
    temp = TrainData{i};
    if Attritype(i) == 1
        temp(isnan(temp))=Attributeavg(i);
    elseif Attritype(i) == 0
        temp(isnan(temp))=Attributeavg(i)+(rand(1))*(rand(1)/10);
    end
    TrainData{i}=temp;
end
flag = 1;
i = 1;
% eliminate all set with missing winner attribute
while flag == 1
    if isnan(TrainData{end}(i))
        for j = 1:cellnum
            TrainData{j}(i)=[];
        end
    else
        i=i+1;
    end
    if i>size(TrainData{end},1)
        flag = 0;
    end
end
end