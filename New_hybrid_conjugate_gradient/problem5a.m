function [D,M] = problem5a(x)

n = length(x);
B = zeros(n);
D = 100*rand(n,1);
A = 2*rand(n)-1;

%set up of a skew-symmetric matrix
for i = 1:n-1
    for j=i+1:n
        B(i,j) = 2*rand()-1;
        B(j,i) = -B(i,j);
    end
end
M = A'*A +B;

