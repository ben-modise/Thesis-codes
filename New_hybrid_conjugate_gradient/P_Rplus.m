function z = P_Rplus(x)
% peforms a box projection onto R_plus for a given vector
n = length(x);
z = x;
for i=1:n
    if z(i)<0
        z(i)=0;
    end
end

