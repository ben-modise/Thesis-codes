function z = problem3(x)
%Ref: New hybrid conjugate gradient projection method for the
%     convex constrained equations. Min Sun & Jing Liu
n = length(x);
%z = zeros(n,1);
z1 = (3-x(1))*x(1) - 2*x(2) + 1;
%for i = 2:n-1
%    z(i) = (3-x(i))*x(i) - x(i-1) -2*x(i+1) +1;
%end
%Vectorizing the for loop, 
xu = x(1:n-2); xm = x(2:n-1); xl = x(3:n);
zn = (3-x(n))*x(n) - x(n-1) +1;
zm = (3*ones(n-2,1)-xm).*xm - xu - 2*xl + ones(n-2,1);
z = [z1;zm;zn];
