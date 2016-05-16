function [w,rho] = P_Simplex(x,z)
% peforms a projection onto the simplex

n  = length(x);

if nargin < 2
    z = n;
end


if norm(x,1) <= z
    rho=n;
    w = x;
    return
end
    
mu = sort(x,'descend');

j = n;
while(mu(j)-1/j*(sum(mu(1:j)) -  z) <0 && j>0)
    j=j-1;    
end
rho = j;

theta = 1/rho*(sum(mu(1:rho)) - z);
w = max(0,x-theta*ones(n,1));
