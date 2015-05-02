% Take one node datacell instances and split based on minimum entropy and
% return splited two new datacells as well as the splitvalue, splitattribute
function [datacell1, datacell2, splitvalue, splitattribute, splitdistribution] = TestSpliting(datacell,Attritype)
splitentropy = 2;
attrnum = size(datacell,2);
for i = 1:attrnum
    if Attritype(i)==1
        [tempsplitvalue, tempentropy, tempdistribution] = DescreteBinarySplit(datacell{i},datacell{end});
    elseif Attritype(i)==0
        [tempsplitvalue, tempentropy, tempdistribution] = ContinueBinarySplit(datacell{i},datacell{end});
    end
    if tempentropy < splitentropy
        splitentropy = tempentropy;
        splitvalue = tempsplitvalue;
        splitattribute = i;
        splitdistribution = tempdistribution;
    end
end
% Join the big data matrix
DataMatrix = [];
datacell1 = {};
datacell2 = {};
for i = 1: attrnum
    DataMatrix = [DataMatrix,datacell{i}]; %#ok<AGROW>
end
% sorting the data according to split attribute
DataMatrix = sortrows(DataMatrix, splitattribute);
index = size(find(DataMatrix(:,splitattribute)<=splitvalue),1);
if index == size(DataMatrix,1)
    index = size(find(DataMatrix(:,splitattribute)<splitvalue),1);
end
if index == 0
    index = round(size(DataMatrix,1)/2);
end
% generate output split cell
for i = 1: attrnum
    datacell1{i} = DataMatrix(1:index,i); %#ok<AGROW>
    datacell2{i} = DataMatrix(index+1:end,i); %#ok<AGROW>
end
end