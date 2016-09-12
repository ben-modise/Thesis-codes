function [ w ] = P_L1Rplus( x,z )
%UNTITLED Performs a Eucledian projection
%   onto the positive orthant of the L1 ball
v = P_Rplus(x);

if nargin < 2
    z = length(v);
end

w = P_L1ball(v,z);  %TODO: find a way to pass an empty argument if 
                    %   none was given at the original function call
end

