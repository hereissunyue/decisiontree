% Take an raw data cell and attribute average as input and output an pure
% real training data and predicted training data
function [TrainData] = GenerateTestData(datacell,Attributeavg, Attritype)
cellnum = size(datacell,2);
TrainData = datacell;
% replace the average data
for i = 1:cellnum
    temp = TrainData{i};
    if Attritype(i) == 1
        temp(isnan(temp))=Attributeavg(i);
    elseif Attritype(i) == 0
        temp(isnan(temp))=Attributeavg(i)+(rand(1))*(rand(1)/10);
    end
    TrainData{i}=temp;
end
end