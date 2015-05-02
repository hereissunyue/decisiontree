% Take the tree and display the disjunctive normal form
function TreeDisplay(Tree, Name, Leaflist, num, Attritype)
% num specify how many relationship to display
for i = 1:num
    templeaf = Leaflist(i,:);
    % extract the result of the leaf first
    Result = Tree{templeaf(1)}(templeaf(2),3*templeaf(3)+2);
    [conditionlist] = BackTrace(templeaf, Tree);
    fprintf('If ');
    for j = 1:size(conditionlist,1)
        fprintf(Name{conditionlist(j,1)});
        if conditionlist(j,3)==1
            fprintf(' <= ');
        elseif conditionlist(j,3)==2
            fprintf(' > ')
        end
        if Attritype(conditionlist(j,1))==1
            fprintf(' %d ', conditionlist(j,2));
        elseif Attritype(conditionlist(j,1))==0
            fprintf(' %4.2f ', conditionlist(j,2));
        end
        if j~= size(conditionlist,1)
            fprintf(' AND ');
        end
    end
    fprintf('. Result is %d\n ', Result);
end
end