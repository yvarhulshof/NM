xs = [2.5 2.0 3.0 1.5 3.5 1.0 4.0 0.5 4.5 0.0 5.0];
ys = [1.25 1.25 0.86 0.93 0.46 0.68 0.26 0.71 0.19 1.01 0.17];
y_tildes = [1.21 1.25 0.83 0.87 0.42 0.67 0.29 0.79 0.16 0.94 0.17];

%used for testing with other noisy data
%y_tildes = ys + rand(1,numel(ys)).*0.06; 

[coeffs_ys, D] = divided_diffs(xs,ys);
coeffs_y_tildes = divided_diffs(xs,y_tildes);

%plot the polynomial interpolation on interval [-0.25, 5.25] with linear
%spacing of 0.01

xs2 = -0.25:0.01:5.25;
interpolated_ys = zeros(1,551);
interpolated_y_tildes = zeros(1,551);

for i = 1:numel(xs2)
   interpolated_ys(i) = evaluate_in_Newton_form(coeffs_ys,xs,xs2(i));
   interpolated_y_tildes(i) = evaluate_in_Newton_form(coeffs_y_tildes,xs,xs2(i));
end

disp('The coefficients using the y values are: ')
disp(coeffs_ys)

disp('The coefficients using the y_tilde values are: ')
disp(coeffs_y_tildes)

disp('The table of divided differences is: ')
disp(D)


 hold on
 plot(xs,ys,'x')
 plot(xs,y_tildes,'o')
 plot(xs2,interpolated_ys)
 plot(xs2,interpolated_y_tildes)


%plots the given x and their y evaluations to check corectness
interpolated_ys = zeros(1,11);
for i = 1:numel(xs)
   interpolated_ys(i) = evaluate_in_Newton_form(coeffs_ys,xs,xs(i));
end

plot(xs,interpolated_ys,'x')

