function [ts,ys] = odeab2(f,t0f,y0,n)
% Solve the differential equations dy/dt=f(t,y)
% over the interval t0f=[t0,tf] starting with y(t0)=y0 
% using n steps of the 2-stage Adams-Bashforth method

    
    % Unpack starting and finishing time 
    t0=t0f(1); tf=t0f(2); 
    
    % Set step size
    h=(tf-t0)/n;
    
    % Initialise
    ts=linspace(t0,tf,n+1);
    ys=zeros(1,n+1); 
    fs=zeros(1,n); 
    
    % Bootstrap using (Ralston's) second-order method
    k1 = h*f(t0,y0);
    k2 = h*f(t0+2/3*h,y0+2/3*k1);
    k  = 1/4*k1 + 3/4*k2;
    t1 = t0 + h;
    y1 = y0 + k;
    
    ys(1)=y0; ys(2) = y1; fs(1)=f(t0,y0); 
    
    for i=2:n,
        fs(i) = f(ts(i),ys(i));
        ys(i+1) = ys(i) + h * (3*fs(i)-fs(i-1));
    end
end