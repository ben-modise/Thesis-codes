function z = problem5(x)
%Ref: New hybrid conjugate gradient projection method for the
%     convex constrained equations. Min Sun & Jing Liu

persistent D;
persistent A B M;

if isempty(D)
    D_ = zeros(size(x));
    n = length(x);
    B_ = zeros(n);
    for i = 1:n
        D_(i) = 100*rand();%*atan(x(i));
    end
    D = D_;
    A = 2*rand(n)-1;
    for i = 1:n-1
        for j=i+1:n
            B_(i,j) = 2*rand()-1;
            B_(j,i) = -B_(i,j);
        end
    end
    B = B_;
end
    
M = A'*A +B;
z = D + M*x;
