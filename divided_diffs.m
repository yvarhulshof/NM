function [coeffs,D] = divided_diffs(xs, ys)
%D is the table of divided differences
D = zeros(numel(xs));
D(:,1) = transpose(ys);

current_col_size = numel(xs) - 1;

for i = 2:numel(xs)
    for j = 1:current_col_size
        D(j,i) = (D(j+1,i-1) - D(j,i-1))./(xs((i-1)+j)-xs(j));   
    end
    current_col_size = current_col_size - 1;
end

coeffs = D(1,:);

end

