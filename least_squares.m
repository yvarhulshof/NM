function [ e2 ] = root_mean_square_error( x,y,n )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
pn = polyval(x,y,n);
    for i=1:numel(x)
        e2 = sum(pn(i) - y(i)).^2;
    end
end

