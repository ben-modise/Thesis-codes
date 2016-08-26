
x0 = zeros(10000,1);
tic;
[x,k1,numf1,gnorm, iflag] = BNN(x0, @problem4);
BNN_time = toc;
tic
[x,k2,numf2,gnorm, iflag] = BD(x0, @problem4);
BD_time = toc;
disp([BNN_time,BD_time])
disp([numf1,numf2])
disp([k1,k2])