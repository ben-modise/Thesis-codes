function z = problem2(x)
%Ref: New hybrid conjugate gradient projection method for the
%     convex constrained equations. Min Sun & Jing Liu
%n = length(x);
%z = zeros(n,1);

z = x - sin(abs(x - 1));
