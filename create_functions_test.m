n = 10;
%functions = cell(n);
%functions{1} = {@(x) 1};
for i = 1:n
    functions = {functions{1:end}, @(x) cos(i*x), @(x) sin(i*x)};
end

disp(functions)