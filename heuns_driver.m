dy = @(t,y) sin(t) + y - y.^3;
%dy = @(t,y) t + y;
y0 = 2;
%h = 0.25 /(7/3);
h = 0.25 /(272/120);
t0 = 0;
tf = 10;

tspan = t0:h:tf;

[final_error] = heuns_3rd_order_span(dy,h,tspan,y0)