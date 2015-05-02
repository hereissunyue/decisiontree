% take the data name as input and return the raw data
function [data] = RawTestLoad(dataname)
load(dataname);
% Saving the data into a cell for code efficiency
data = {dayssincegame, homeaway, numinjured, oppdayssincegame, oppnuminjured, opprundifferential, oppstartingpitcher,...
    oppwinpercent, rundifferential, startingpitcher, temperature, weather, winpercent};
% Since the name here is origined from workspace file, I failed to automatically set up this cell from workspace, 
% so please change the name befor you run a new scenario assign attribute type 1 means nominal 0 means numberical
end