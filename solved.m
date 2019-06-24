function[value] = solved(S)
value=0;
rows=0;
cols=0;
sum=0;
for i = 1:9
    for j = 1:9
        sum = sum + IsElement(j,S(i,:));
    end
end
if sum == 81
    rows=1;
end
sum=0;
for i = 1:9
    for j = 1:9
        sum = sum + IsElement(j,S(:,i));
    end
end
if sum == 81
    cols = 1;
end
if rows == 1
    if cols == 1
        value = 1;
    end
end
