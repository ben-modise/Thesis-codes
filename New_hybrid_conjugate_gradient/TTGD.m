function [x,k,numf,gnorm, iflag] = TTGD(x0,f,P,tol,maxit)
%   A self-adaptive three-term conjugate gradient method
%   for monotone nonlinear equations with convex constraints
%   X Wang, S Li, X Kou. DOI 10.1007/s10092-015-0140-5

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
    
clc; 
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

rho = 0.5;
sigma = 1e-6;
tau = 2;
ga = 1.5; %gamma variable
delta = 1.9;
eta = 0.2;

k=0;
if strcmp(f,'problem5b')
    [Da,M] = problem5a(x0);
end
xk = x0; 
if strcmp(f,'problem5b')
    Fk = feval(f,xk,Da,M);
else
    Fk = feval(f,xk);
end
numf = 1;
iflag = 0;
% variablename_1 represents the value at k-1

dk_1 = zeros(size(Fk));

%thetak = 0;
%yk_1 = zeros(size(Fk));

%A = 2; B = 1; C = 3;

while(norm(Fk) > tol && k <= maxit) %step1
    % step2: calculation of direction

    if isequal(k,0) || A < B || A > C
        dk = -Fk;
        
    else
        dk = -Fk + b_hs*dk_1 - thetak*yk_1;       
    end
    
    if norm(dk)<tol
        x = xk; 
        gnorm = norm(Fk);
        return;
    end
    
    % step3: finding the trial point wk - line search
    mk=0;
    alp = rho^mk;
    wk = xk + alp*dk;  
    if strcmp(f,'problem5b')
        Fw = feval(f,wk,Da,M);
    else
        Fw = feval(f,wk);
    end
    numf = numf+1;
    while(-Fw'*dk < eta*alp*norm(dk)^2)
        mk = mk+1;
        if(mk > 1000)
            disp('trial point zk iterations exceeded')
            iflag = 1;
            return;
        end
        alp = rho^mk;
        wk = xk + alp*dk;  
        if strcmp(f,'problem5b')
            Fw = feval(f,wk,Da,M);
        else
            Fw = feval(f,wk);
        end
        numf = numf+1;
    end
    % the algorithm given checks if Fw==0 and stops if true
    if norm(Fw)<1.e-8  %has to be tighter than tol since Fk would not have been updated
        x = xk; 
        gnorm = norm(Fk);
        if gnorm>tol
            iflag = 3;
        end
        return
    end
    
    % step4: computing the next iterate 
    Xi = (Fw'*(xk - wk))/norm(Fw)^2;
    xk_1 = xk;
    xk = P(xk - ga*Xi*Fw);
    
    % Set bk to be in [bmin, bmax]. For now we let bk=1 for all k
    
    Fk_1 = Fk;
    dk_1 = dk;
    if strcmp(f,'problem5b')
        Fk = feval(f,xk,Da,M);
    else
        Fk = feval(f,xk);
    end
    numf = numf + 1;
    if norm(Fk)<tol
        break
    end
    
    yk_1 = Fw - Fk_1;
    thetak = (Fk'*dk_1)/(dk_1'*yk_1);
    b_hs = (Fk'*yk_1)/(dk_1'*yk_1);
    
    sk = wk - xk_1;
    A = sk'*yk_1;
    B = sigma*norm(Fk)^tau*(sk'*sk);
    C = delta*norm(Fk)^tau*(sk'*sk);
    k = k+1;
    
end
x = xk; 
gnorm = norm(Fk);

if (norm(Fk) > tol && k >= maxit),
    iflag =2;
end
