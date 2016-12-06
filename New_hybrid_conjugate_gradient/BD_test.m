%this script runs the test for the proposed algorithm in Ben's Msc
%dissertation

%problem 1
%setting initial points.
dim=10000;
x1 = ones(dim,1); x2 = 100*ones(dim,1); x3 = 0.1*ones(dim,1);
x4a = ones(dim,1); x4b = (1:dim)';x4=x4a./x4b; x5 = flip(x4); x6 = x1 - x4;

%TODO: iterate through the initial points and run our algorithm 
%and store or print to file the data points.
[~,k2,numf2,~, ~] = BD(x1, @problem1, @P_Rplus);

%problem 2
dim=10000;
x1 = ones(dim,1); % x2 = 100*ones(dim,1); is outside the constraint, 
%projection onto the convex set yields x1
x3 = 0.1*ones(dim,1);
x4a = ones(dim,1); x4b = (1:dim)';x4=x4a./x4b; x5 = flip(x4); x6 = x1 - x4;

[~,k1,numf1,~, ~] = BNN(x0, @problem2, @P_L1Rplus);

%problem3
dim=10000;
x1 = ones(dim,1); x2 = -ones(dim,1); x3 = 0.1*ones(dim,1);
x4a = ones(dim,1); x4b = (1:dim)';x4=x4a./x4b; x5 = flip(x4); x6 = x1 - x4;

[x,k2,numf2,~,iflag] = BNN(x0, @problem3);

%problem4
dim = 10000;
%x1 = ones(dim,1);  %this is the solution we are looking for.
x2 = zeros(dim,1); x3 = 0.1*ones(dim,1);
x4a = ones(dim,1); x4b = (1:dim)';x4=x4a./x4b; x5 = flip(x4); x6 = x1 - x4;

[x,k2,numf2,~,iflag] = BD(x4, @problem4);
%problem 5
dim =100;

clear functions;
x1 = ones(dim,1); x2 = 10*ones(dim,1); x3 = 0.1*ones(dim,1);
x4a = ones(dim,1); x4b = (1:dim)';x4=x4a./x4b; x5 = flip(x4); x6 = x1 - x4;
[x,k2,numf2,~, iflag] = BD(x0, @problem5, @P_Rplus);

