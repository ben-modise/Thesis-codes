%problem 1
x0 = zeros(10000,1);
tic;
[~,k1,numf1,~, ~] = BNN(x0, @problem1, @P_Rplus);
BNN_time = toc;
tic
[~,k2,numf2,~, ~] = BD(x0, @problem1, @P_Rplus);
BD_time = toc;
disp([BNN_time,BD_time])
disp([numf1,numf2])
disp([k1,k2])

%problem 2
x0 = ones(10000,1);
tic;
[~,k1,numf1,~, ~] = BNN(x0, @problem2, @P_L1Rplus);
BNN_time = toc;
tic
[~,k2,numf2,~, ~] = BD(x0, @problem2, @P_L1Rplus);
BD_time = toc;
disp([BNN_time,BD_time])
disp([numf1,numf2])
disp([k1,k2])

%problem 3
x0 = -ones(10000,1);
tic;
[~,k1,numf1,~, ~] = BNN(x0, @problem3);
BNN_time = toc;
tic
[~,k2,numf2,~, ~] = BD(x0, @problem3);
BD_time = toc;
disp([BNN_time,BD_time])
disp([numf1,numf2])
disp([k1,k2])

%problem 4
x0 = zeros(10000,1);
tic;
[~,k1,numf1,~, ~] = BNN(x0, @problem4);
BNN_time = toc;
tic
[x,k2,numf2,gnorm, iflag] = BD(x0, @problem4);
BD_time = toc;
disp([BNN_time,BD_time])
disp([numf1,numf2])
disp([k1,k2])