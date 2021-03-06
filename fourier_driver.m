%f = @(x) x.^2
f = @(x) sin(3.*x)./(2+cos(x) + sin(2*x));
xs = linspace(-pi,pi,500);
%n = 6;
%[a,b,ys] = fourier(f,-pi,pi,xs,n);

%displaying the coefficients up to degree 6
[a,b,ys] = fourier(f,-pi,pi,xs,6);
disp('a coefficents: ')
disp(a)
disp('b coefficients: ')
disp(b)

%plotting the original function
hold on
fplot(f)

for i = 1:3
    [a,b,ys] = fourier(f,-pi,pi,xs,i);
    %plotting the fourier approximation
    plot(xs,ys)
end

hold on
%plotting the original function
fplot(f)
%plotting the fourier approximation
plot(xs,ys,'g')