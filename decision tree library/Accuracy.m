% Take the test data, tree as input and return testaccuracy
function [accuracy] = Accuracy(Tree, TestData, Attritype, partnum, division)
% Make the missing data with average with small disturbance
[NaNcount] = CountNaN(TestData);
[Attributeavg] = Attriavg(TestData, NaNcount, Attritype);
[TestData] = GenerateData(TestData, Attributeavg, Attritype);
Testsize = size(TestData{1},1);
length = Testsize/division;

% Testing start
sum = 0;
for i = (partnum-1)*length+1 : (partnum)*length
    [instance] = Instance(i, TestData);
    [result] = TreePredict(instance, Tree);
    if result == TestData{end}(i)
        sum = sum +1;
    end
end
accuracy = sum/i;
end