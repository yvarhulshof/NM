function [ a,b,ys ] = fourier( f,A,B,xs,n )
    %n is the degree of the trigonometric polynomial
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
 
for i = 1:numel(xs)
    ys(i) = a(1)/2;
    for k = 2:n+1
        ys(i) = ys(i) + a(k) .* cos((k-1)*xs(i)) + b(k) .* sin((k-1)*xs(i));
    end
end


%plotting only sk for k = 1,2,3

end

