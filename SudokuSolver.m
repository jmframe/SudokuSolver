% Sudoku Solver by Jonathan Frame 2012

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
 
% llh keeps track of the possible numbers in each position of the puzzle
llh=zeros(81,2);llh(:,2)=1:81;
% "done" is a logical binomial tracking whether the puzzle has been solved
done=0;
% "walls" counts the number of times the solver got stuck and started over
walls=0;
% "Sinit" keeps track of the puzzle as it stands without any guesses. Each
% time the solver gets stuck, it goes back to this point
Sinit = S; init = 0; %"init" = logical binomial to go with "Sinit"

while done==0
    % "count" keeps track of the 1D position in the puzzle
    count=0; 
    % "possible" is an array with each possible number at each position in
    % the puzzle, this narrows down the permutations
    possible = zeros(9,9,9); llh=zeros(81,2);llh(:,2)=1:81;
    % Here we are going through the puzzle to find the possibilities at
    % each position
    for j=1:9
        for i = 1:9
            count=count+1;
            if S(i,j) == 0 % number must be absent to find possibilities
                k=0; % "k" is just a convinient postion in the array
                for v = 1:9
                    % "IsElement" check to see if a number is an element of
                    % an array. This simple function is kinda the base of
                    % solving sudoku
                    if IsElement(v, S(:,j)) == 0
                        if IsElement(v, S(i,:)) == 0
                            % "SudokuBox" just assigns the 3*3 array to
                            % check if a number is already used.
                            if IsElement(v,SudokuBox(i,j,S)) == 0
                                k=k+1;
                                possible(i,j,k)=v;
                                llh(count,1)=k;
                            end
                        end
                    end
                end
            else
                % if the sudoku position has been filled then give it a
                % default "llh" value, it is large for sorting purposes
                llh(count,1)=999; 
            end
        end
    end
    % sort "llh" to find the best starting point for a string of guesses
    llh=sortrows(llh,1);  
    LLH = min(llh(:,1));
    
    % if there are no vacancies in our puzzle
    if LLH > 1
        % Check to see if the puzzle has been solved, if so, DONE!!
        if solved(S) == 1
            done=1;
            break
        end
    end
    
    % Setting the last version of the puzzle without guesses, only need to
    % do this once, hopefully progress has been made.
    if init == 0
        if LLH > 1
            Sinit = S;
            init = 1;
        end
    end
    
    i=llh(1,2); % the best next position to place a number
    j=i-floor((i-1)/9)*9; % convert 1D to 2D position rows
    k=1+floor((i-1)/9);   % convert 1D to 2D position columns
    % Attempting to place a number in a vacant position in the puzzle
    % best to try a random possible number rather than going in order, to
    % give variety in the solving attempts.
    for q = randperm(9) 
        v = possible(j,k,q); % "v" is our guess for the vavant spot
        if v~=0; % no need to bother going forward with zeros
            if IsElement(v, S(j,:)) == 0
                if IsElement(v, S(:,k)) == 0
                    if IsElement(v,SudokuBox(j,k,S)) == 0
                        % this was a successful guess, placing the number
                        % and moving on..
                        S(i) = v; 
                        break;
                    end 
                end
            end
        end
    end
    
    % counting times we hit a wall, reset puzzle to last known good state
    if S(i)==0
        S=Sinit;
        walls = walls+1;
    end

end
S