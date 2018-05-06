function [ final_error ] = heuns_3rd_order_span(f,h,tspan,y0)
%HEUNS_3RD_ORDER Summary of this function goes here
%   Detailed explanation goes here
    
    w = y0;
    
    w_values = y0;
    
    t10_exact = 0.8607315969;

    for i = 1 : (numel(tspan)-1)

        t = tspan(i);
        
        k1 = h*f(t,w);
        k2 = h*f(t+(1/3)*h,w+(1/3)*k1);
        k3 = h*f(t+(2/3)*h,w+(2/3)*k2);

        w_i_plus_1 = w + 0.25*(k1 + 3*k3);
        
        w_values(i+1) = w_i_plus_1;
        
        w = w_i_plus_1;
    end
    
    % when h doesn't divide into 10 without residue, this code is needed
    % to calculate w for t = 10
    h = 10 - tspan(end);
    t = 10;
    
    k1 = h*f(t,w);
    k2 = h*f(t+(1/3)*h,w+(1/3)*k1);
    k3 = h*f(t+(2/3)*h,w+(2/3)*k2);

    w_i_plus_1 = w + 0.25*(k1 + 3*k3);
        
    w_values = [w_values, w_i_plus_1];
    %%    

    disp(w)
    final_error = w_values(end) - t10_exact;
end