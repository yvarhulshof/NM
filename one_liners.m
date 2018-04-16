% Bisection method
a=1; b=2; f=@(x)x^2-2; fa=f(a); fb=f(b); % start
c=(a+b)/2; fc=f(c); [a,c,b;fa,fc,fb], if sign(fa)==sign(fc), a=c; fa=fc; else b=c; fb=fc; end; % loop

% Initialisation for differential equations
f = @(t,y) y-t^2+1; % Define function f for dy/dt = f(t,y)
t=0.0; w=0.5; h=0.2; % Define initial condition and step size
S=[t;w] % Define initial solution trace

% Midpoint method single step
new_w = w + h * f( t+h/2, w+h/2*f(t,w) ); new_t = t+h; new_t,new_w
% Midpoint method updating t,w
w = w + h * f( t+h/2, w+h/2*f(t,w) ); t = t+h; t,w
% Midpoint method updating t,w, S
w = w + h * f( t+h/2, w+h/2*f(t,w) ); t = t+h; t,w, S=[S,[t;w]]

% 4th-order Runge-Kutta method updating t,w
k1=h*f(t,w); k2=h*f(t+h/2,w+k1/2); k3=h*f(t+h/2,w+k2/2); k4=h*f(t+h,w+k3); t=t+h, w=w+(k1+2*k2+2*k3+k4)/6,

% 2-stage Adams-Bashforth method with current state x, previous state w,
% next state y
y=x+h/2*(3*f(t,x)-f(t-h,w)); t,w,x,y
% 2-stage Adams-Bashforth method updating t,w,x
y=x+h/2*(3*f(t,x)-f(t-h,w)); t=t+h,w=x,x=y
% 2-stage Adams-Moulton method using predictor yp, updating t,w,x
yp=x+h/2*(3*f(t,x)-f(t-h,w)); y=x+h/12*(5*f(t+h,yp)+8*f(t,x)-f(t-h,w)); t,w,x,yp,y, t=t+h;w=x;x=y;

% Built-in Matlab command for solving differential equations
% Initial time t0, final time tf, initial state w0
t0=0.0; tf=4.0; w0=0.5; % Define initial condition and step size
ode45(f,[t0,tf],w0) % Solve differential equation 


