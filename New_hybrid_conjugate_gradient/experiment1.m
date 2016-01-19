function experiment1
% A program that runs the projection gradient methods 

clear;
clc;
% warning off MATLAB:divideByZero
% warning off MATLAB:mir_warning_variable_used_as_function

% Initialising the variables.
numberFunctions = 3;

%% %Preparing a progress report printout to the output file for all the test functions.

fprintf(1, '\n  Projection Gradient methods results \n\n');
output = fopen('projBNN.txt','wt');
fprintf(output, '\n New hybrid conjugate gradient projection method for the convex constrained equations. \n\n');
fprintf(output, '\n ---------------------------------------------------------\n');
fprintf(output, 'FN \t\t ObjFun\t\t Dim\t iflag \t NI \t NFE\t\t CPU \t\t norm(g0)\n');

%%

% Running the test functions.
for functionCounter = 1 : numberFunctions,
    switch functionCounter,   
        % First problem
        case {1},
            functionNumber = 1;
            objfun = 'problem1';
            dim = 1000;
            x0=ones(dim,1);
            %Minimum = 0; 
        case {2},
            functionNumber = 2;
            objfun = 'problem1';
            dim = 10000;
            x0=ones(dim,1);
            %Minimum = 0;
            
        case {3}
            functionNumber = 3;
            objfun = 'problem1';
            dim = 100000;
            x0=ones(dim,1);
            %minimum = 0 
               
        case {4},
            functionNumber = 4;
            objfun = 'problem1';
            dim = 10000;
            x0=-1*ones(dim,1);
            %Minimum = 0;
            
        case {5},
            functionNumber = 5;
            objfun = 'problem1';
            dim = 1000;
            x0=0.1*ones(dim,1);
            %Minimum = 0;
            
        case {6}
            functionNumber = 6;
            objfun = 'problem1';
            dim = 1000;
            x0 = zeros(dim,1);
            for i = 1:dim,
                x0(i)=1/i;
            end
            %minimum = 0
            
        case {7}
            functionNumber = 7;
            objfun = 'problem1';
            dim = 1000;
            x0=zeros(dim,1);
            for i=1:dim,
                x0(i)=i/dim;
            end
            %minimum = 0 
            
        case {8}
            functionNumber = 8;
            objfun = 'problem1';
            dim = 1000;
            x0=zeros(dim,1);
            for i=1:dim,
                x0(i) = 1-i/dim;
            end
            %min = 0 
       
            % Second Problem
        
        case {9},
            functionNumber = 9;
            objfun = 'problem2';
            dim = 1000;
            x0=-10*ones(dim,1);
            %Minimum = 0; 
        case {10},
            functionNumber = 10;
            objfun = 'problem2';
            dim = 1000;
            x0=-10*ones(dim,1);
            %Minimum = 0;
            
        case {11}
            functionNumber = 11;
            objfun = 'problem2';
            dim = 1000;
            x0=ones(dim,1);
            %minimum = 0 
               
        case {12},
            functionNumber = 12;
            objfun = 'problem2';
            dim = 1000;
            x0=-1*ones(dim,1);
            %Minimum = 0;
            
        case {13},
            functionNumber = 13;
            objfun = 'problem2';
            dim = 1000;
            x0=0.1*ones(dim,1);
            %Minimum = 0;
            
        case {14}
            functionNumber = 14;
            objfun = 'problem2';
            dim = 1000;
            x0 = zeros(dim,1);
            for i = 1:dim,
                x0(i)=1/i;
            end
            %minimum = 0
            
        case {15}
            functionNumber = 15;
            objfun = 'problem2';
            dim = 1000;
            x0=zeros(dim,1);
            for i=1:dim,
                x0(i)=i/dim;
            end
            %minimum = 0 
            
        case {16}
            functionNumber = 16;
            objfun = 'problem2';
            dim = 1000;
            x0=zeros(dim,1);
            for i=1:dim,
                x0(i) = 1-i/dim;
            end
            %min = 0 
        % Third Problem 
        
        case {17},
            functionNumber = 17;
            objfun = 'problem3';
            dim = 1000;
            x0=-10*ones(dim,1);
            %Minimum = 0; 
            
        case {18},
            functionNumber = 18;
            objfun = 'problem3';
            dim = 1000;
            x0=-10*ones(dim,1);
            %Minimum = 0;
            
        case {19}
            functionNumber = 19;
            objfun = 'problem3';
            dim = 1000;
            x0=ones(dim,1);
            %minimum = 0 
               
        case {20},
            functionNumber = 20;
            objfun = 'problem3';
            dim = 1000;
            x0=-1*ones(dim,1);
            %Minimum = 0;
            
        case {21},
            functionNumber = 21;
            objfun = 'problem3';
            dim = 1000;
            x0=0.1*ones(dim,1);
            %Minimum = 0;
            
        case {22}
            functionNumber =22;
            objfun = 'problem3';
            dim = 1000;
            x0 = zeros(dim,1);
            for i = 1:dim,
                x0(i)=1/i;
            end
            %minimum = 0
            
        case {23}
            functionNumber = 23;
            objfun = 'problem3';
            dim = 1000;
            x0=zeros(dim,1);
            for i=1:dim,
                x0(i)=i/dim;
            end
            %minimum = 0 
            
        case {24}
            functionNumber = 24;
            objfun = 'problem3';
            dim = 1000;
            x0=zeros(dim,1);
            for i=1:dim,
                x0(i) = 1-i/dim;
            end
            %min = 0 
         % Fourth Problem
         
        case {25},
            functionNumber = 25;
            objfun = 'problem4';
            dim = 1000;
            x0=-10*ones(dim,1);
            %Minimum = 0; 
        case {26},
            functionNumber = 26;
            objfun = 'problem4';
            dim = 1000;
            x0=-10*ones(dim,1);
            %Minimum = 0;
            
        case {27}
            functionNumber = 27;
            objfun = 'problem4';
            dim = 1000;
            x0=ones(dim,1);
            %minimum = 0 
               
        case {28},
            functionNumber = 28;
            objfun = 'problem4';
            dim = 1000;
            x0=-1*ones(dim,1);
            %Minimum = 0;
            
        case {29},
            functionNumber = 29;
            objfun = 'problem4';
            dim = 1000;
            x0=0.1*ones(dim,1);
            %Minimum = 0;
            
        case {30}
            functionNumber = 30;
            objfun = 'problem4';
            dim = 1000;
            x0 = zeros(dim,1);
            for i = 1:dim,
                x0(i)=1/i;
            end
            %minimum = 0
            
        case {31}
            functionNumber = 31;
            objfun = 'problem4';
            dim = 1000;
            x0=zeros(dim,1);
            for i=1:dim,
                x0(i)=i/dim;
            end
            %minimum = 0 
            
        case {32}
            functionNumber = 32;
            objfun = 'problem4';
            dim = 1000;
            x0=zeros(dim,1);
            for i=1:dim,
                x0(i) = 1-i/dim;
            end
            %min = 0 
        
            % Fifth Problem 
        
        case {33},
            functionNumber = 33;
            objfun = 'problem5';
            dim = 1000;
            x0=-10*ones(dim,1);
            %Minimum = 0; 
            
        case {34},
            functionNumber = 34;
            objfun = 'problem5';
            dim = 1000;
            x0=-10*ones(dim,1);
            %Minimum = 0;
            
        case {35}
            functionNumber = 35;
            objfun = 'problem5';
            dim = 1000;
            x0=ones(dim,1);
            %minimum = 0 
               
        case {36},
            functionNumber = 36;
            objfun = 'problem5';
            dim = 1000;
            x0=-1*ones(dim,1);
            %Minimum = 0;
            
        case {37},
            functionNumber = 37;
            objfun = 'problem5';
            dim = 1000;
            x0=0.1*ones(dim,1);
            %Minimum = 0;
            
        case {38}
            functionNumber = 38;
            objfun = 'problem5';
            dim = 1000;
            x0 = zeros(dim,1);
            for i = 1:dim,
                x0(i)=1/i;
            end
            %minimum = 0
            
        case {39}
            functionNumber = 39;
            objfun = 'problem5';
            dim = 1000;
            x0=zeros(dim,1);
            for i=1:dim,
                x0(i)=i/dim;
            end
            %minimum = 0 
            
        case {40}
            functionNumber = 40;
            objfun = 'problem5';
            dim = 1000;
            x0=zeros(dim,1);
            for i=1:dim,
                x0(i) = 1-i/dim;
            end
            %min = 0 
            
        % Sixth Problem 
        
        case {41},
            functionNumber = 41;
            objfun = 'problem6';
            dim = 1000;
            x0=-10*ones(dim,1);
            %Minimum = 0; 
            
        case {42},
            functionNumber = 42;
            objfun = 'problem6';
            dim = 1000;
            x0=-10*ones(dim,1);
            %Minimum = 0;
            
        case {43}
            functionNumber = 43;
            objfun = 'problem6';
            dim = 1000;
            x0=ones(dim,1);
            %minimum = 0 
               
        case {44},
            functionNumber = 44;
            objfun = 'problem6';
            dim = 1000;
            x0=-1*ones(dim,1);
            %Minimum = 0;
            
        case {45},
            functionNumber = 45;
            objfun = 'problem6';
            dim = 1000;
            x0=0.1*ones(dim,1);
            %Minimum = 0;
            
        case {46}
            functionNumber = 46;
            objfun = 'problem6';
            dim = 1000;
            x0 = zeros(dim,1);
            for i = 1:dim,
                x0(i)=1/i;
            end
            %minimum = 0
            
        case {47}
            functionNumber = 47;
            objfun = 'problem6';
            dim = 1000;
            x0=zeros(dim,1);
            for i=1:dim,
                x0(i)=i/dim;
            end
            %minimum = 0 
            
        case {48}
            functionNumber = 48;
            objfun = 'problem6';
            dim = 1000;
            x0=zeros(dim,1);
            for i=1:dim,
                x0(i) = 1-i/dim;
            end
            %min = 0 
        
        % Seventh Problem 
        
        case {49},
            functionNumber = 49;
            objfun = 'problem';
            dim = 1000;
            x0=-10*ones(dim,1);
            %Minimum = 0; 
        case {50},
            functionNumber = 50;
            objfun = 'problem';
            dim = 1000;
            x0=-10*ones(dim,1);
            %Minimum = 0;
            
        case {51}
            functionNumber = 51;
            objfun = 'problem';
            dim = 1000;
            x0=ones(dim,1);
            %minimum = 0 
               
        case {52},
            functionNumber = 52;
            objfun = 'problem';
            dim = 1000;
            x0=-1*ones(dim,1);
            %Minimum = 0;
            
        case {53},
            functionNumber = 53;
            objfun = 'problem';
            dim = 1000;
            x0=0.1*ones(dim,1);
            %Minimum = 0;
            
        case {54}
            functionNumber = 54;
            objfun = 'problem';
            dim = 1000;
            x0 = zeros(dim,1);
            for i = 1:dim,
                x0(i)=1/i;
            end
            %minimum = 0
            
        case {55}
            functionNumber = 55;
            objfun = 'problem';
            dim = 1000;
            x0=zeros(dim,1);
            for i=1:dim,
                x0(i)=i/dim;
            end
            %minimum = 0 
            
        case {56}
            functionNumber = 56;
            objfun = 'problem';
            dim = 1000;
            x0=zeros(dim,1);
            for i=1:dim,
                x0(i) = 1-i/dim;
            end
            %min = 0         
    end;
    
    %% Preparing a progress report to the files.
    % method = 'PJO';
    fprintf(output, '%2d\t\t%9s\t%5d\t', functionNumber, objfun, dim);
    tic;
    [~,k,numf,gnorm, iflag] = TTGD(x0,objfun,@P_Rplus);
    %[~,iter,numf,gnorm, iflag] = DFPB(x0,objfun,1.e-4,10000);
    tsec=toc;
    fprintf(output,'%2d\t\t %3d\t%4d\t%10.8f\t\t%12.8f\n',iflag,k,numf,tsec,gnorm);
    
end;

% Closing the PJO text files.
fclose('all');
fprintf(1, 'Program completed running\n');
