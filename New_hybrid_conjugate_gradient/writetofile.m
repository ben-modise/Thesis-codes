function writetofile(init,varargin)
%writes to csv file the output 
%usage: writetofile(init, Problem(objective function), Projection)
%tests BNN, BD and TTGD

Problem = varargin{1};
n= size(init,2); %gives the number of test points
dim = size(init,1);
outputfile = strcat('Results/',func2str(Problem),'.csv');%'char(problem)' fails in octave so use func2str(problem)


%TODO: add output files for each metric in prepartion for performance
%profile plotting
output = fopen(outputfile,'wt');
iters = fopen('itersfile.csv','at');
fevals = fopen('fevalsfile.csv','at');
CPU = fopen('cpufile.csv','at');
%fprintf(output,'\n Results for Problem 1 in the hybrid CG proj scheme\n');
fprintf(output,'Initial, Dim,iters,Fn Evals,CPU,Iters,Fn Evals,CPU,iters,Fn Evals,CPU\n');
fprintf(output,' , , BNN, , , BD, , ,TTGD \n');


%strcat to concatenate strings
for i=1:n
   [~,~,~,~, ~] = BNN(init(:,i), varargin{:});
   tic;
   [~,k3,numf3,~, ~] = TTGD(init(:,i), varargin{:});
   time3=toc; tic;
   [~,k2,numf2,~, ~] = BNN(init(:,i), varargin{:});
   time2=toc; tic;
   [~,k,numf,~,~] = BD(init(:,i), varargin{:}); 
   time=toc;
   %str_i = vname(i);
   xi = strcat('x',num2str(i));
   %fprintf(output,'%2d\t\t %3d\t%4d\t%10.8f\t\t%12.8f\n',iflag,iter,numf,tsec,gnorm);
   fprintf(output,'%s,%2d,%d,%d,%f, %d,%d,%f,%d,%d,%f\n',xi,dim,k2,numf2,time2,k,numf,time,k3,numf3,time3);
   fprintf(iters, '%d,%d,%d\n',k2,k,k3);
   fprintf(fevals, '%d,%d,%d\n',numf2,numf,numf3);
   fprintf(CPU, '%f,%f,%f\n', time2,time,time3);
end

fclose(output);
fclose(iters);
fclose(fevals);
fclose(CPU);
