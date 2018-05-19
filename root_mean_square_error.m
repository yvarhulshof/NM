function [ e2 ] = root_mean_square_error( x,y,n )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
pn = polyfit(x,y,n);
    for i=1:numel(x)
        e2 = sum(polyval(pn,x(i)) - y(i)).^2;
    end
    e2 = sqrt(e2/numel(x));
    
    
end

