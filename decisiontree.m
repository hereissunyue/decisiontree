%% Preface
% Name: Yue Sun     ID: 2880445      Email:sunyue@u.northwestern.edu
% Course: Machine Learning 
% HW1: Decision Tree Algorithm Implementation


%% Path Setting and Data Reading
% Dear TAs, please change this path correspondingly to your computer local directory! Thank you!
addpath('C:\Users\sunyue\Desktop\Machine Learning\HW2')  % path of .m file
addpath('C:\Users\sunyue\Desktop\Machine Learning\HW2\data')  % path of data
addpath('C:\Users\sunyue\Desktop\Machine Learning\HW2\decision tree library')  % path of library
addpath('C:\Users\sunyue\Desktop\Machine Learning\HW2\data\temporary data')  % path of temporary data

% Since there are missing attributes in the .csv file represented as ?.Matlab function will have 
% difficulties to call csvread() function. However, with the help of "Import Data" Function in 
% "HOME" section, we could import the data successfully while replace character ? as NaN for
% future programming. Since the importing process will take some time, I already save the imported 
% data Workspace named with the same name as the .csv file. Please just open the corresponding .mat
% file instead of .csv file for testing and programming.
% Since there three files have exactly the same attributes name, the importing of Workspace data 
% will overwrite the data. I will set very noticable warning when change is needed.


%% [Training Routine]
% Now Please Open the btrain.mat Workspace for training routine!!!!!
load('btrain.mat');


%% [Training Routine] 1. Preprocessing the Training Data
% % This section might take 8 seconds to get the result, temporary workspace data is saved as btrainGD1.mat
% % If you don't want to run the code so far, please lode the corresponding workspace data. Thank you!
% % Hint: Please selet from line A to B line and press Ctrl+T to uncomment and run. If you want comment back press Ctrl+R. Thank you!
load('btrainGD1.mat')

% % set up the attribute type
% Attritype = [1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 0, 1];
% % load the train raw data
% TrainDataRaw = RawDataLoad('btrain.mat');
%
% % Count NaN which is missing attributes in each element of the cell
% [NaNcount] = CountNaN(TrainDataRaw);
% % Count The average value except unknown value
% [Attributeavg] = Attriavg(TrainDataRaw, NaNcount, Attritype);
% 
% % Generate Training data Policy
% % 1. If the Winner attribute of a set of example is missing, then discard this set
% % 2. Replace other missing attribute with its average situation
% [TrainData] = GenerateData(TrainDataRaw,Attributeavg, Attritype);


%% [Training Routine] 2. Root node Entropy Calculation and Split Decision
% % This section might take 17 seconds to get the result, temporary workspace data is saved as btrainRS1.mat
% % If you don't want to run the code so far, please lode the corresponding workspace data. Thank you!
% % Hint: Please selet from line A to B line and press Ctrl+T to uncomment and run. If you want comment back press Ctrl+R. Thank you!
load('btrainRS1.mat');

% % This section is showing how the entropy function is working as well as calculation of minimum split entropy 
% % for each attribute and decide how to split the root node.
% [entropy] = NodeEntropy(TrainData{end});
% [datacell1, datacell2, splitvalue, splitattribute] = Spliting(TrainData,Attritype);
% % entropy of the node = 0.9599   splitattribute = 5  = oppnuminjured
% % splitvalue = 1   splitentropy = 0.8535
% % datacell1 has 22520 instances; datacell2 has 24902 instances


%% [Training Routine] 3. Training the whole Tree
% % This section might take 57 seconds to get the result, temporary workspace data is saved as btrainT1.mat
% % If you don't want to run the code so far, please lode the corresponding workspace data. Thank you!
% % Hint: Please selet from line A to B line and press Ctrl+T to uncomment and run. If you want comment back press Ctrl+R. Thank you!
load('btrainT1.mat');

% [Tree, Leaflist] = GenerateTree(TrainData,Attritype);
% % The Tree is represented by cell. The dimension of the cell means the layer of the tree. In this training data we get 44 layers.
% % The spliting are all binary spliting. Eace element of the Tree cell is a nx8 matrix. n corresponding to the branch number. 
% % 8 have special meaning as following: 
% % [splitattribute, splitvalue, entropycheck1, pointer1, leafvalue1, entropycheck2, pointer2, leafvalue2]
% % 1.splitattribute: new split attribute
% % 2.splitvalue: new split threshold
% % 3.entropycheck1: split branch 1 entropy fulfill leafnode 1 not 0
% % 4.pointer1: the pointer to the next layer position for split branch 1
% % 5.leafvalue1: if the next brance is leaf node, then give the leafvalue
% % 6.entropycheck2: split branch 2 entropy fulfill leafnode 1 not 0
% % 7.pointer2: the pointer to the next layer position for split branch 2
% % 8.leafvalue2: if the next brance is leaf node, then give the leafvalue


%% [Training Routine] 4. Input of Tree Testing and Validation Accuracy
% % This section might take 12 seconds to get the result, temporary workspace data is saved as btrainVA1.mat
% % If you don't want to run the code so far, please lode the corresponding workspace data. Thank you!
% % Hint: Please selet from line A to B line and press Ctrl+T to uncomment and run. If you want comment back press Ctrl+R. Thank you!
load('btrainVA1.mat');

% % load the validate raw data
% ValidateDataRaw = RawDataLoad('bvalidate.mat');
% % Checking the accuracy of the whole training data
% [wholeaccuracy] = Accuracy(Tree, TrainDataRaw, Attritype, 1, 1);  % around 0.9877
% [validateaccuracy] = Accuracy(Tree, ValidateDataRaw, Attritype, 1, 1);  % around 0.9128
% % The functionality of my decision tree is reasonable based on the accuracy of validataion data


%% [Training Routine] 5. Display Boolean formula of Tree in Disjunctive Normal Form
% % This section might take 1 seconds to get the result, temporary workspace data is saved as btrainDS1.mat
% % If you don't want to run the code so far, please lode the corresponding workspace data. Thank you!
% % Hint: Please selet from line A to B line and press Ctrl+T to uncomment and run. If you want comment back press Ctrl+R. Thank you!
load('btrainDS1.mat');

% % sice the leafnode list size is 2707, it is impossible to display whole
% % the decision tree, so the display will be specified to display only 16 of them
% Name = {'dayssincegame', 'homeaway', 'numinjured', 'oppdayssincegame', 'oppnuminjured', 'opprundifferential', 'oppstartingpitcher',...
%      'oppwinpercent', 'rundifferential', 'startingpitcher', 'temperature', 'weather', 'winpercent', 'winner'};
% 
% num = 16; % print only 16 leafnodes specification
TreeDisplay(Tree, Name, Leaflist, num, Attritype);
 

%% [Training Routine] 6. Pruning the Tree
% % This section might take 1 seconds to get the result, temporary workspace data is saved as btrainPU1.mat
% % If you don't want to run the code so far, please lode the corresponding workspace data. Thank you!
% % Hint: Please selet from line A to B line and press Ctrl+T to uncomment and run. If you want comment back press Ctrl+R. Thank you!
load('btrainPU1.mat');

% [nodecount] = CountNode(Tree);
% % Plot the branch of each layer
% figure(1)
% plot(nodecount,'LineWidth',3);
% legend('Branch Number')
% xlabel('Layer') 
% grid on
% % From the branch layer relationship plotting, after the peak, less branch more likely to have less instances remaining
% % I decided to start test pruning from layer 30, if not good we will move down to lower layer. The pruning have large 
% % prossibility not working at all, so long testing is required.
% prunelayer = 26;
% [PurnedTree, newaccuracy, cutpoint] = GeneratePrunTree(Tree, prunelayer, Attritype, ValidateDataRaw); 
% % Since there is random value for replacing missing attribute the Purned the result from the function above might 
% % generate different result. The best pruning is saved in btrainPU1.mat which could achieve 
% % round 0.9131 - 0.9136 accuracy which improved %0.3-%0.8 which is an reasonable pruning

% % calculate the size difference between Tree and PrunedTree
[splitnum1] = TreeSplit(Tree); % Tree has 2706 splits
[splitnum2] = PrunedTreeSplit(Tree, cutpoint, prunelayer); % Tree has 2364 splits


%% [Training Routine] 7. Larning Curve
% % This section might take more than 30 mins!!!! to get the result, temporary workspace data is saved as btrainLC1.mat
% % If you don't want to run the code so far, please lode the corresponding workspace data. Thank you!
% % Hint: Please selet from line A to B line and press Ctrl+T to uncomment and run. If you want comment back press Ctrl+R. Thank you!
 load('btrainLC1.mat');

% % generate curve data
% [curvedata] = CurveData(TrainData, ValidateDataRaw, Attritype);
% plot(curvedata)
% figure(2)
% plot(linspace(10,100,19),curvedata(:,1),'r','LineWidth',2);
% hold on
% plot(linspace(10,100,19),curvedata(:,2),'b','LineWidth',2);
% hold off
% title('Learning Curve')
% legend('Original Tree','Pruned Tree')
% xlabel('Percentage of Training Samples') 
% grid on


%% [Training Routine] 8. Testing on Unlabeled Dataset
% % This section might take more than 1 second to get the result, temporary workspace data is saved as btrainTS1.mat
% % If you don't want to run the code so far, please lode the corresponding workspace data. Thank you!
% % Hint: Please selet from line A to B line and press Ctrl+T to uncomment and run. If you want comment back press Ctrl+R. Thank you!
load('btrainTS1.mat');

% % Load the test data
% [TestData] = RawTestLoad('btest.mat');
% [Testresult] = TestPredict(Tree, TestData, Attritype);