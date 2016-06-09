function [w] = P_L1ball(v,z)
% peforms a projection onto the l1- ball


if nargin < 2
    z = length(v);
end

if norm(x,1) <= z
    w = v;
    return
end
    

u = abs(v);
b = P_Simplex(u,z);
w = sign(v).*b;
