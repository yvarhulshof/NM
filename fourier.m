function [ y ] = fourier( f,A,B,x )
    %UNTITLED Summary of this function goes here
    %   Detailed explanation goes here
    a = zeros(1,10);
    b = zeros(1,10);
    
    %fa = @(x) f(x) * cos(x);
    %fb = @(x) f(x) * sin(x);
    for k = 1:10 
        fa = @(x) f .* cos(k*x);
        a(k) = 1/pi * integral(fa,A,B); 
        fb = @(x) f .* sin(k*x);
        b(k) = 1/pi * integral(fb,A,B); 
    end

    y = a0/2;
    for k = 1:10;
        y = y + a(k) * cos(k*x) + b(k) * sin(k*x);
    end

end

