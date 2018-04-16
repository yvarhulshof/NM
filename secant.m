function [p1] = untitled(f,p0,p1,eps,nmax)
    for i = 0:nmax
    if(abs(p1-p0) < eps) 
       break
    end
    a = (f(p1)-f(p0))./(p1-p0)
    b = f(p0) - a * p0
    p0 = p1
    p1 = -b/a
    end
end

%{   
   r=secant(f,p0,p1,eps,nmax)
   -find equation of line through p0 and p1 which is
    y = ax + b, a = (f(p0)-f(p1))/(p0-p1)
    y = ax + b through (p0,f(p0))
    f(p0) = a*p0 + b, b = f(p0) - a *p0
    now that we have the equation of the secant line,
    we solve it for y = 0
    0 = a*x + b
    a*x = -b
    x = -b/a
 %}
    

