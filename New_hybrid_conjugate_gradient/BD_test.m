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
n= size(init,2); %gives the number of test points
output = fopen('Results/Problem1.csv','wt');
fprintf(output,'\n Results for Problem 1 in the hybrid CG proj scheme\n');
fprintf(output,'Initial, Dim, BNN, , BD, , \n');
fprintf(output,',,Iterations,Function Evals,Iterations,Function Evals\n');
%strcat to concatenate strings
for i=1:n
   [~,k,numf,~,iflag] = BD(init(:,i), @problem1, @P_Rplus); 
   [~,k2,numf2,~,iflag2] = BNN(init(:,i), @problem1, @P_Rplus);
   %str_i = vname(i);
   xi = strcat('x',num2str(i));
   %fprintf(output,'%2d\t\t %3d\t%4d\t%10.8f\t\t%12.8f\n',iflag,iter,numf,tsec,gnorm);
   fprintf(output,'%s,%2d,%d,%d, %d,%d\n',xi,dim,k2,numf2,k,numf);
end

fclose(output);



%problem 2
dim=10000;
x1 = ones(dim,1); % x2 = 100*ones(dim,1); is outside the constraint, 
%projection onto the convex set yields x1
x2 = rand(dim,1);
x3 = 0.1*ones(dim,1);
x4a = ones(dim,1); x4b = (1:dim)';x4=x4a./x4b; x5 = flip(x4); x6 = x1 - x4;

init = [x1,x2,x3,x4,x5,x6];
fprintf('     Testing problem 2\n');
fprintf('---------------------------------\n')
n= size(init,2); %gives the number of test points
output = fopen('Results/Problem2.csv','wt');
fprintf(output,'\n Results for Problem 2 in the hybrid CG proj scheme\n');
fprintf(output,'Initial, Dim, BNN, , BD, , \n');
fprintf(output,',,Iterations,Function Evals,Iterations,Function Evals\n');
%strcat to concatenate strings
for i=1:n
   [~,k,numf,~,iflag] = BD(init(:,i), @problem2,@P_L1Rplus); 
   [~,k2,numf2,~,iflag2] = BNN(init(:,i), @problem2,@P_L1Rplus);
   %str_i = vname(i);
   xi = strcat('x',num2str(i));
   %fprintf(output,'%2d\t\t %3d\t%4d\t%10.8f\t\t%12.8f\n',iflag,iter,numf,tsec,gnorm);
   fprintf(output,'%s,%2d,%d,%d, %d,%d\n',xi,dim,k2,numf2,k,numf);
end

fclose(output);

%problem3
dim=10000;
x1 = ones(dim,1); x2 = -ones(dim,1); x3 = 0.1*ones(dim,1);
x4a = ones(dim,1); x4b = (1:dim)';x4=x4a./x4b; x5 = flip(x4); x6 = x1 - x4;
init = [x1,x2,x3,x4,x5,x6];
fprintf('     Testing problem 3\n');
fprintf('---------------------------------\n')
n= size(init,2); %gives the number of test points
output = fopen('Results/Problem3.csv','wt');
fprintf(output,'\n Results for Problem 3 in the hybrid CG proj scheme\n');
fprintf(output,'Initial, Dim, BNN, , BD, , \n');
fprintf(output,',,Iterations,Function Evals,Iterations,Function Evals\n');
%strcat to concatenate strings
for i=1:n
   [~,k,numf,~,iflag] = BD(init(:,i), @problem3); 
   [~,k2,numf2,~,iflag2] = BNN(init(:,i), @problem3);
   %str_i = vname(i);
   xi = strcat('x',num2str(i));
   %fprintf(output,'%2d\t\t %3d\t%4d\t%10.8f\t\t%12.8f\n',iflag,iter,numf,tsec,gnorm);
   fprintf(output,'%s,%2d,%d,%d, %d,%d\n',xi,dim,k2,numf2,k,numf);
end

fclose(output);

%problem4
dim = 10000;
%x1 = ones(dim,1);  %this is the solution we are looking for.
x1 = -10*ones(dim,1);
x2 = zeros(dim,1); x3 = 0.1*ones(dim,1);
x4a = ones(dim,1); x4b = (1:dim)';x4=x4a./x4b; x5 = flip(x4); x6 = x1 - x4;
init = [x1,x2,x3,x4,x5,x6];
fprintf('     Testing problem 4\n');
fprintf('---------------------------------\n')
n= size(init,2); %gives the number of test points
output = fopen('Results/Problem4.csv','wt');
fprintf(output,'\n Results for Problem 4 in the hybrid CG proj scheme\n');
fprintf(output,'Initial, Dim, BNN, , BD, , \n');
fprintf(output,',,Iterations,Function Evals,Iterations,Function Evals\n');
%strcat to concatenate strings
for i=1:n
   [~,k,numf,~,iflag] = BD(init(:,i), @problem4); 
   [~,k2,numf2,~,iflag2] = BNN(init(:,i), @problem4);
   %str_i = vname(i);
   xi = strcat('x',num2str(i));
   %fprintf(output,'%2d\t\t %3d\t%4d\t%10.8f\t\t%12.8f\n',iflag,iter,numf,tsec,gnorm);
   fprintf(output,'%s,%2d,%d,%d, %d,%d\n',xi,dim,k2,numf2,k,numf);
end

fclose(output);


%problem 5
dim =100;

clear functions;
x1 = ones(dim,1); x2 = 10*ones(dim,1); x3 = 0.1*ones(dim,1);
x4a = ones(dim,1); x4b = (1:dim)';x4=x4a./x4b; x5 = flip(x4); x6 = x1 - x4;
init = [x1,x2,x3,x4,x5,x6];
fprintf('     Testing problem 5\n');
fprintf('---------------------------------\n')
n= size(init,2); %gives the number of test points
output = fopen('Results/Problem5.csv','wt');
fprintf(output,'\n Results for Problem 5 in the hybrid CG proj scheme\n');
fprintf(output,'Initial, Dim, BNN, , BD, , \n');
fprintf(output,',,Iterations,Function Evals,Iterations,Function Evals\n');
%strcat to concatenate strings
for i=1:n
   [~,k,numf,~,iflag] = BD(init(:,i), @problem5,@P_Rplus); 
   [~,k2,numf2,~,iflag2] = BNN(init(:,i), @problem5,@P_Rplus);
   %str_i = vname(i);
   xi = strcat('x',num2str(i));
   %fprintf(output,'%2d\t\t %3d\t%4d\t%10.8f\t\t%12.8f\n',iflag,iter,numf,tsec,gnorm);
   fprintf(output,'%s,%2d,%d,%d, %d,%d\n',xi,dim,k2,numf2,k,numf);
end

fclose(output);

% [x,k2,numf2,~, iflag] = BD(x0, @problem5, @P_Rplus);

