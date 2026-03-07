% Define the interpolation points
x = [1.615, 1.634, 1.702, 1.828];
y = [2.41450, 2.46259, 2.65271, 3.03035];
disp(['Interpolation points x: ', num2str(x)]);
disp(['Function values at interpolation points y = f(x): ', num2str(y)]);

disp('--- Newton interpolation ---');

% Compute the divided difference table
dd = divided_difference(x, y);
disp('Divided difference table: ');
disp(dd);

% Compute the Newton interpolation polynomial
P = newtonInterp(x, y, dd);
disp(['Newton interpolation polynomial P_n: ', char(vpa(P, 4))]);

% Evaluate the interpolation polynomial at x = 1.682
x_interp = 1.682;
y_interp = double(subs(P, x_interp));
disp(['x_interp: ', num2str(x_interp)]);
disp(['Newton interpolation at x_interp: ', num2str(y_interp)]);
