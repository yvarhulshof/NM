function [ approximation ] = heuns_3rd_order(f,h,t,w)
%HEUNS_3RD_ORDER Summary of this function goes here
%   Detailed explanation goes here
    k1 = h*f(t,w);
    k2 = h*f(t+(1/3)*h,w+(1/3)*k1);
    k3 = h*f(t+(2/3)*h,w+(2/3)*k2);
    
    approximation = w + 0.25*(k1 + 3*k3);

end

