function z = problem5(x)
%Ref: New hybrid conjugate gradient projection method for the
%     convex constrained equations. Min Sun & Jing Liu

persistent aj;
persistent A B M;

if isempty(aj)
    %disp('resetting M and D')
    n = length(x);
    aj = 100*rand(n,1);
    B_ = zeros(n);
    A = 2*rand(n)-1;
    for i = 1:n-1
        for j=i+1:n
            B_(i,j) = 2*rand()-1;
            B_(j,i) = -B_(i,j);
        end
    end
    B = B_;
end
D = aj.*atan(x);
M = A'*A +B;
z = D + M*x;
