function [ ys ] = fourier( f,A,B,xs,n )
    %UNTITLED Summary of this function goes here
    %   Detailed explanation goes here
    a = zeros(1,n);
    b = zeros(1,n);
    ys = zeros(1,numel(xs));
    
    
 %finding the coefficients   
 for k = 1:n+1 
  fa = @(x) f(x) .* cos((k-1)*x);
  a(k) = 1/pi * integral(fa,A,B); 
  fb = @(x) f(x) .* sin((k-1)*x);
  b(k) = 1/pi * integral(fb,A,B); 
 end
 
 %disp(a)
 %disp(b)

 
%s3_0point5 = a(1)./2 + a(2)*cos(0.5) + a(3)*cos(1) + a(4)*cos(1.5);
%disp(s3_0point5) 

for i = 1:numel(xs)
    ys(i) = a(1)/2;
    for k = 2:n+1
        ys(i) = ys(i) + a(k) .* cos((k-1)*xs(i)) + b(k) .* sin((k-1)*xs(i));
    end
end


hold on
fplot(f)
plot(xs,ys)

%disp(xs)
%disp(ys)

end

