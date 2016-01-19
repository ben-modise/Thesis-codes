function z = problem0(x)
n = length(x);
z = zeros(n,1);
for i = 1:n,
    z(i) = 2*x(i)-sin(x(i));
end
