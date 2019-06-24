function[box] = SudokuBox(i,j,S)
Sr = zeros(1,3);
Sc = zeros(1,3);
if 1 <= i
    Sr = 1:3;
end
if 4 <= i 
    Sr = 4:6;
end
if 7 <= i
    Sr = 7:9;
end
if 1 <= j
    Sc = 1:3;
end
if 4 <= j 
    Sc = 4:6;
end
if 7 <= j
    Sc = 7:9;
end
box=S(Sr,Sc);