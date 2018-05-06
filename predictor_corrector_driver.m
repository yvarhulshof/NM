dy = @(t,y) sin(t) + y - y.^3;
y0 = 2;
h = 0.25;
t0 = 0;
tf = 10;

tspan = t0:h:tf;

answer = predictor_corrector(dy,h,tspan,y0)

%disp(answer)