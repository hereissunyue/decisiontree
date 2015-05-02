% Take the data cell and return part of the cell in cell form
function [partdata] = PartData(datacell, start, goal)
column = size(datacell,2);
partdata = {};
for i = 1:column
    tempdata = datacell{i}(start:goal);
    partdata{i} = tempdata; %#ok<AGROW>
end
end