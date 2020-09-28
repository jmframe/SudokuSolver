# SudokuSolver by Jonathan Frame (2012)
## A little program I wrote to solve sudoku puzzles
### I wrote this code for two reasons
#### 1. Because I could. I thought through an algotithm that solves any "solvable" sudoku, and I wanted to test it. Once I wrote this I never felt the need to solve any sudokus again, because I feel that I have technically already solved every/any sudoku already.
#### 2. I wanted to test my coding skills. I had previously used coding for hydrological research, but when I would tell people I knew how to code, they didn't believe me. So I actually challenged someone to write a sudoku solver, and we would see who wrote the fastest code. They didn't even finish.
# HOW TO RUN:
    1. Open the file called "SudokuSolver.m
    2. Replace lines 3-12 with the sudoku you want to solve
    3. Run the script.
# To Test
    Try this as an input:
    % Enter the Sudoku puzzle you would like to solve
    S = [1,0,0,0,0,7,0,9,0;...
         0,3,0,0,2,0,0,0,8;...
         0,0,9,6,0,0,5,0,0;...
         0,0,5,3,0,0,9,0,0;...
         0,1,0,0,8,0,0,0,2;...
         6,0,0,0,0,4,0,0,0;...
         3,0,0,0,0,0,0,1,0;...
         0,4,0,0,0,0,0,0,7;...
         0,0,7,0,0,0,3,0,0];
    This should be the output:
    S =
     1     6     2     8     5     7     4     9     3
     5     3     4     1     2     9     6     7     8
     7     8     9     6     4     3     5     2     1
     4     7     5     3     1     2     9     8     6
     9     1     3     5     8     6     7     4     2
     6     2     8     7     9     4     1     3     5
     3     5     6     4     7     8     2     1     9
     2     4     1     9     3     5     8     6     7
     8     9     7     2     6     1     3     5     4
# To-Do:
    1. re-write in a free language.
    2. develop an interface
    3. Just kidding, I'll probably never get around to that.
