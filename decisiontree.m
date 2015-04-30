%% Preface
% Name: Yue Sun     ID: 2880445      Email:sunyue@u.northwestern.edu
% HW1: Machine Learning Decision Tree Algorithm Implementation


%% Path Setting and Data Reading
% Dear TAs, please change this path correspondingly to your computer local directory! Thank you!
addpath('C:\Users\sunyue\Desktop\Machine Learning\HW2')  % path of data
addpath('C:\Users\sunyue\Desktop\Machine Learning\HW2\decision tree library')  % path of library

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
% Now Please Open the btrain.mat Workspace for training routine!!!!!
% Now Please Open the btrain.mat Workspace for training routine!!!!!


%% [Training Routine] Preprocessing the Training Data
% Saving the data into a cell for code efficiency
traindata = {dayssincegame, homeaway, numinjured, oppdayssincegame, oppnuminjured, opprundifferential, oppstartingpitcher,...
    oppwinpercent, rundifferential, startingpitcher, temperature, weather, winpercent, winner};
% Count NaN which is missing attributes in each element of the cell



