% Take the test data, tree as input and return testaccuracy
function [result] = TestPredict(Tree, TestData, Attritype)
% Make the missing data with average with small disturbance
[NaNcount] = CountNaN(TestData);
[Attributeavg] = AttriavgTest(TestData, NaNcount, Attritype);
[TestData] = GenerateTestData(TestData, Attributeavg, Attritype);
result = [];
for i = 1 : size(TestData{1},1)
    [instance] = TestInstance(i, TestData);
    result(i) = TreePredictTest(instance, Tree); %#ok<AGROW>
end
result = transpose(result);
end