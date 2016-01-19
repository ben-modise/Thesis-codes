function [x,k,numf,gnorm, iflag] = CGD(x0,f,P,tol,maxit)
%   A conjugate gradient method to solve convex constrained
%   monotone equations with applications in
%   compressed sensing. Yunhai Xiao*, Hong Zhu
%   J. Math. Anal. Appl. 405 (2013) 310-319

%   This program implements the algorithm for the above paper for 
%   solving convex constrained equations that are monotone.

%   Input: x0  = initial iterate -- must be within the constraints
%          f   = objective function f: R^n-->R^n
%          P   = the projection function onto the constraint region C
%                optional, default: P(x) = x
%          tol = termination criterion norm(F_k) <= tol
%                optional, default = 1.e-5
%        maxit = maximum iterations (optional) default = 50000
%
%   Output: x     = solution
%           k  = iteration history
%           numf  = number of function evaluations
%           norm(Fk) = norm of objective function value
%           iflag = 0 algorithm successful
%                 = 1 steplength unsuccessful
%                 = 2 norm(Fk) > tol && iter > maxit
    
    
if nargin < 3
    P = @constantfunction;
elseif isempty(P)
    P = @constantfunction;
end

% input validation

if norm(P(x0)-x0)~=0
    error('x0 is not in C');
end


% initialize variables
if nargin < 5
    maxit = 2000; 
end
if nargin < 4
    tol = 1.e-5;
end


%TODO: perhaps the following should also be inputs with default values


sigma = 1e-4;
rho = 0.39;
epsl = 1;



xk = x0; 
Fk = feval(f,xk);
numf = 1;
iflag = 0;
% variablename_1 represents the value at k-1
Fk_1 = Fk;
dk_1 = zeros(size(Fk));

k = 0;

while(norm(Fk) > tol && k <= maxit) %step1
    % step2: calculation of direction
    if isequal(k,0)
        bk=0;
    else
        Fk = feval(f,xk);
        numf = numf + 1;
        %calculation of the hybrid beta parameter
        gam_k = Fk - Fk_1;
        temp = max([0,-1*gam_k'*(tk*dk_1)/(norm(tk*dk_1))^2]);
        lam_k = 1 + (norm(Fk_1)^(-1))*temp;
        yk_1 = gam_k + lam_k*tk*norm(Fk_1)*dk_1;
        temp1 = dk_1'*yk_1;
        temp2 = yk_1-2*dk_1*norm(yk_1)^2/(dk_1'*yk_1);
        bk = (temp2'*Fk)/temp1;
    end
    eta = max([bk,0]);
    dk = -Fk + eta*dk_1;
    
    if(norm(dk)<tol)
        x = xk; 
        gnorm = norm(Fk);
        return;
    end
    
    % step3: finding the trial point zk - line search
    mk=0;
    tk = epsl*rho^mk;
    zk = xk + tk*dk;  
    Fz = feval(f,zk);
    numf = numf+1;
    while(-Fz'*dk < sigma*tk*norm(dk)^2)
        mk = mk+1;
        if(mk > 1000)
            disp('trial point zk iterations exceeded')
            iflag = 1;
            return;
        end
        tk = epsl*rho^mk;
        zk = xk + tk*dk;   
        Fz = feval(f,zk);
        numf = numf+1;
    end
    % the algorithm given checks if Fz==0 and stops if true
    if norm(Fz)<1.e-7  %has to be tighter than tol since Fk would not have been updated
        x = xk; 
        gnorm = norm(Fk);
        if gnorm>tol
            iflag = 3;
        end
        return
    end
    
    % step4: computing the next iterate 
    alp_k = (Fz'*(xk - zk))/norm(Fz)^2;
    xk = P(xk - alp_k*Fz);
    
    % Set bk to be in [bmin, bmax]. For now we let bk=1 for all k
    k = k+1;
    Fk_1 = Fk;
    dk_1 = dk;
end
x = xk; 
gnorm = norm(Fk);
k = k-1;
if (gnorm > tol && k >= maxit)
    iflag =2;
end
