function [ errors ] = least_squares_orthogonal( w,n,A,B )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
functions = 1;
%for i = 1:n
%    functions = [functions, @(x) cos(n*x), @(x) sin(n*x)];
%end

j = 1;

if(mod(j,2) == 0) phi = @(x) sin(j*x);
else phi = @(x) cos(j*x);
%alfa_j = integral(A,B, w.*(phi)^.2);

end

