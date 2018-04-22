function [ estimate ] = adams_bashforth_3rd_order(f,h,t,w_i_minus_2)
%ADAMS_BASHFORTH_3RD_ORDER Summary of this function goes here
%   Detailed explanation goes here
    
    w_i_minus_1 = heuns_3rd_order(f,h,t-h,w)

    w_i_plus_1 = w + (h/12)*(23*f(t,w)-16*f(t-h,

end

