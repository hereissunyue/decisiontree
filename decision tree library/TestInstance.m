% Take the datacell and instance row number return instance in array
function [instance] = TestInstance(num, datacell)
attribute = size(datacell,2);
instance = zeros(1,attribute);
for i = 1:attribute
   instance(i) = datacell{i}(num); 
end
end