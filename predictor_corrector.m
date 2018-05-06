function [ final_error ] = predictor_corrector(f,h,tspan,y0)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

    w1 = heuns_3rd_order(f,h,tspan(1),y0);
  
    w2 = heuns_3rd_order(f,h,tspan(2),w1);
    
    w_values = [y0, w1, w2];
    
    t10_exact = 0.8607315969;
    
    for i = 3:(numel(tspan) - 1)
    
        % Predictor: Three-stage Adams-Bashforth method
        estimated_w_i_plus_1 = w_values(i) + (h/12)*(23*f(tspan(i),w_values(i))-16*f(tspan(i-1),w_values(i-1))+5*f(tspan(i-2), w_values(i-2)));
       
        % Corrector Three-stage implicit Adams-Moulton method, using
        % estimate as the implicit value
        w_i_plus_1 = w_values(i) + ((h/24)*(9*f(tspan(i+1),estimated_w_i_plus_1) + 19*f(tspan(i),w_values(i)) - 5*f(tspan(i-1),w_values(i-1)) + f(tspan(i-2), w_values(i-2))));
        
        w_values = [w_values, w_i_plus_1];
    end
    disp(w_values)
    final_error = w_values(end) - t10_exact;
end

