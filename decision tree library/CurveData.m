% Take the input and return curedata
function [curvedata] = CurveData(TrainData, ValidateDataRaw, Attritype)
curvedata = zeros(2,100);
total = size(TrainData{1},1);
for i = 1:100
    tempTrainData = PartData(TrainData, 1, round(i*0.25*total)-1);
    [tempTree, ~] = GenerateTree(tempTrainData,Attritype);
    curvedata(1,i) = Accuracy(tempTree, ValidateDataRaw, Attritype, 1, 1);
    prunelayer = round((26*size(tempTree,2))/45);
    [~, newaccuracy, ~] = GeneratePrunTree(tempTree, prunelayer, Attritype, ValidateDataRaw); 
    curvedata(2,i) = newaccuracy;
    curvedata(i)
end
end