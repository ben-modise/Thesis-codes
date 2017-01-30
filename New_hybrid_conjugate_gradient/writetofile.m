function writetofile(init,varargin)
%writes to csv file the output 
%usage: writetofile(init, Problem(objective function), Projection)
%tests BNN, BD and TTGD

Problem = varargin{1};
n= size(init,2); %gives the number of test points
dim = size(init,1);
outputfile = strcat('Results/',char(Problem),'.csv');
output = fopen(outputfile,'wt');
%fprintf(output,'\n Results for Problem 1 in the hybrid CG proj scheme\n');
fprintf(output,['Initial, Dim,Iters,Fn Evals'...
',Iters,Fn Evals,Iters,Fn Evals\n']);
fprintf(output,' , , BNN, , BD,,TTGD, \n');
%strcat to concatenate strings
for i=1:n
   [~,k,numf,~,~] = BD(init(:,i), varargin{:}); 
   [~,k2,numf2,~, ~] = BNN(init(:,i), varargin{:});
   [~,k3,numf3,~, ~] = TTGD(init(:,i), varargin{:});
   %str_i = vname(i);
   xi = strcat('x',num2str(i));
   %fprintf(output,'%2d\t\t %3d\t%4d\t%10.8f\t\t%12.8f\n',iflag,iter,numf,tsec,gnorm);
   fprintf(output,'%s,%2d,%d,%d, %d,%d,%d,%d\n',xi,dim,k2,numf2,k,numf,k3,numf3);
end

fclose(output);