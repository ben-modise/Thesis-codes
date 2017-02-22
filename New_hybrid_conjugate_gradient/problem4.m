function z = problem6(x)
%Ref: A projection method for a system of nonlinear 
%     monotone equations with convex constraints.
%     Wang, Wang & Xu. DOI 10.1007/s001 86-006-0140-y

%     Original problem from Yamashita and Fukushima (1997)
A = [1,0,0,0; 0,1,-1,0;0,1,1,0;0,0,0,0];
b = [x(1)^3;x(2)^2;2*x(3)^3;2*x(4)^2];
c = [-10;1;-3;0];

z = A*x + b + c;
