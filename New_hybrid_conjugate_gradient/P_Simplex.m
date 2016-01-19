function [z,rho] = P_Simplex(x)
% peforms a projection onto the simplex
n = length(x);
mu = sort(x,'descend');

j = n;
while(mu(j)-1/j*(sum(mu(1:j)) -  n) <0 && j>0)
    j=j-1;    

end
rho=j;
theta = 1/rho*(sum(mu(1:rho)) - n)
z = max(0,x-theta*ones(n,1));

