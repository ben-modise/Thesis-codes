function z = problem4(x)
%Ref: New hybrid conjugate gradient projection method for the
%     convex constrained equations. Min Sun & Jing Liu
n = length(x);
z = zeros(n,1);
z(1) = 3*x(1)^3 + 2*x(2) - 5 + sin(x(1)-x(2))*sin(x(1)+x(2));
for i = 2:n-1

    z(i) = -x(i-1)*exp(x(i-1)-x(i)) + x(i)*(4+3*x(i)^2)...
     + 2*x(i+1) + sin(x(i) - x(i+1))*sin(x(i)+x(i+1)) - 8;
end
z(n) = -x(n-1)*exp(x(n-1)-x(n)) + 4*x(n)-3;
