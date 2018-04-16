function [ ts, ws ] = oderk4( f, t0f, y0, n )
% Solve the differential equations dy/dt=f(t,y)
% over the interval t0f=[t0,tf] starting with y(t0)=y0 
% using n steps of the classical 4th-order Runge-Kutta method

    t0=t0f(1); tf=t0f(2);
    h=(tf-t0)/n; 
    ts=[t0];
    ws=[y0];
    t=t0;
    w=y0;
    for i=1:n, 
        k1=h*f(t,w),
        k2=h*f(t+h/2,w+k1/2),
        k3=h*f(t+h/2,w+k2/2), 
        k4=h*f(t+h,w+k3), 
        w=w+(k1+2*k2+2*k3+k4)/6;
        t=t+h; 
        ts(i+1)=t; 
        ws(i+1)=w; 
    end;

end

