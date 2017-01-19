%this script runs the test for the proposed algorithm in Ben's Msc
%dissertation

%problem 1
%setting initial points.
dim=10000;
%vname=@(x) inputname(1); %to be able to convert variable names to strings

x1 = ones(dim,1); x2 = 100*ones(dim,1); x3 = 0.1*ones(dim,1);
x4a = ones(dim,1); x4b = (1:dim)';x4=x4a./x4b; x5 = flip(x4); x6 = x1 - x4;

init = [x1,x2,x3,x4,x5,x6];
fprintf('     Testing problem 1\n');
fprintf('---------------------------------\n')
writetofile(init, @problem1, @P_Rplus);

%problem 2
dim=10000;
x1 = ones(dim,1); % x2 = 100*ones(dim,1); is outside the constraint, 
%projection onto the convex set yields x1
x2 = rand(dim,1);
%x3 = 0.1*ones(dim,1);
x4a = ones(dim,1); x4b = (1:dim)';x4=x4a./x4b; x5 = flip(x4); x6 = x1 - x4;

init = [x1,x2,x4,x5,x6];%,x3 exceeds zk trial iterations for BD
fprintf('     Testing problem 2\n');
fprintf('---------------------------------\n')
writetofile(init, @problem2,  @P_L1Rplus);

%problem3
dim=10000;
x1 = ones(dim,1); x2 = -ones(dim,1); x3 = 0.1*ones(dim,1);
x4a = ones(dim,1); x4b = (1:dim)';x4=x4a./x4b; x5 = flip(x4); x6 = x1 - x4;
init = [x1,x2,x3,x4,x5,x6];
fprintf('     Testing problem 3\n');
fprintf('---------------------------------\n')
writetofile(init, @problem3);

%problem4
dim = 10000;
%x1 = ones(dim,1);  %this is the solution we are looking for.
x1 = -10*ones(dim,1);
x2 = zeros(dim,1); x3 = 0.1*ones(dim,1);
x4a = ones(dim,1); x4b = (1:dim)';x4=x4a./x4b; x5 = flip(x4); x6 = x1 - x4;
init = [x1,x2,x3,x4,x5,x6];
fprintf('     Testing problem 4\n');
fprintf('---------------------------------\n')
writetofile(init, @problem4);


%problem 5
dim = 200;

clear functions;
x1 = ones(dim,1); x2 = 10*ones(dim,1); x3 = 0.1*ones(dim,1);
x4a = ones(dim,1); x4b = (1:dim)';x4=x4a./x4b; x5 = flip(x4); x6 = x1 - x4;
init = [x1,x2,x3,x4,x5,x6];
fprintf('     Testing problem 5\n');
fprintf('---------------------------------\n')
writetofile(init, @problem5,@P_Rplus);

