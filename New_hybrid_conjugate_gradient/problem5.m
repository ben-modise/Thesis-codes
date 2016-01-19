function z = problem5(x)
%Ref: New hybrid conjugate gradient projection method for the
%     convex constrained equations. Min Sun & Jing Liu
D = zeros(size(x));
n = length(x);
B = zeros(n);
for i = 1:n
    D(i) = 100*rand()*atan(x(i));
end
A = 2*rand(n)-1;
for i = 1:n-1
    for j=i+1:n
        B(i,j) = 2*rand()-1;
        B(j,i) = -B(i,j);
    end
end
M = A'*A +B;
z = D + M*x;
