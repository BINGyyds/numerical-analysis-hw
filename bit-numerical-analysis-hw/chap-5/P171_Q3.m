% Define the interpolation points
x = [1, 3, 4, 6];
y = [-7, 5, 8, 14];
disp(['Interpolation points x: ', num2str(x)]);
disp(['Function values at interpolation points f(x): ', num2str(y)]);

disp('--- Lagrange interpolation ---');

% Compute the Lagrange interpolation polynomial
L = lagrangeInterp_disp(x, y);
disp(['Lagrange interpolation polynomial L_n: ', char(L)]);

% Evaluate the interpolation polynomial at x = 0.3
x_interp = 2;
y_interp = double(subs(L, x_interp));
disp(['x_interp: ', num2str(x_interp)]);
disp(['Lagrange interpolation at x_interp: ', num2str(y_interp)]);
