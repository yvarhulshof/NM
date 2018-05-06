function [evaluation] = evaluate_in_Newton_form(coeffs,xs,x)
%evaluation = coeffs(1);
evaluation = 0;

for i = 1:numel(coeffs)
    x_terms = 1;
    for j = 1:i-1
        x_terms = x_terms * (x - xs(j));
    end
    %f = f + @(x) coeffs(i) * x_terms;
    evaluation = evaluation + coeffs(i) * x_terms;
end

end

