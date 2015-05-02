% Take the datacell and instance row number return instance in array
function [instance] = Instance(num, datacell)
attribute = size(datacell,2);
instance = zeros(1,attribute-1);
for i = 1:attribute-1
   instance(i) = datacell{i}(num); 
end
end