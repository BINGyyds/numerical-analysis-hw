% Define the original function
f = @(x) exp(x .^ 2 - 1);
disp(['Original function f: ', func2str(f)]);

% Define the interpolation points
x = [1.0, 1.1, 1.2, 1.3, 1.4];
y = f(x);
disp(['Interpolation points x: ', num2str(x)]);
disp(['Function values at interpolation points y = f(x): ', num2str(y)]);

disp('--- Lagrange interpolation ---');

% Compute the Lagrange interpolation polynomial
L = lagrangeInterp_disp(x, y);
disp(['Lagrange interpolation polynomial L_n: ', char(vpa(L, 4))]);

% Evaluate the interpolation polynomial at x = 1.25
x_interp = 1.25;
y_interp = double(subs(L, x_interp));
disp(['x_interp: ', num2str(x_interp)]);
disp(['Lagrange interpolation at x_interp: ', num2str(y_interp)]);

% Compute the (n+1)-th derivative of the original function
syms xs;
n = length(x) - 1;
f_sym = exp(xs .^ 2 - 1);
f_derivative = diff(f_sym, n + 1);
disp(['n: ', num2str(n)]);
disp(['(n+1)-th derivative of the original function: ', char(f_derivative)]);

% Compute abs(omega_n+1)/(n+1)! at x_interp
product_term = prod(abs(x_interp - x));
factorial_term = factorial(n + 1);
result = product_term / factorial_term;
disp(['abs(omega_n+1)/(n+1)! at x_interp: ', num2str(result)]);

% Evaluate the error
zeta = (x(end) + x(1)) / 2;
error_bound = double(subs(f_derivative, zeta)) * result;
disp(['zeta: ', num2str(zeta)]);
disp(['Error bound: ', num2str(error_bound)]);

disp('--- Lagrange interpolation END ---');

disp('--- Newton interpolation ---');

% Compute the divided difference table
dd = divided_difference(x, y);
disp('Divided difference table: ');
disp(dd);

% Compute the Newton interpolation polynomial
P = newtonInterp(x, y, dd);
disp(['Newton interpolation polynomial P_n: ', char(vpa(P, 4))]);

% Evaluate the interpolation polynomial at x = 1.25
x_interp = 1.25;
y_interp = double(subs(P, x_interp));
disp(['x_interp: ', num2str(x_interp)]);
disp(['Newton interpolation at x_interp: ', num2str(y_interp)]);

disp('--- Newton interpolation END ---');

disp('--- Newton interpolation of degree 5 ---');

% Compute the Newton interpolation polynomial of degree 5
x_5 = [1.0, 1.1, 1.2, 1.3, 1.4, 1.5];
y_5 = f(x_5);
disp(['Interpolation points for degree 5 x: ', num2str(x_5)]);
disp(['Function values at interpolation points y = f(x): ', num2str(y_5)]);

% Compute the divided difference table for degree 5
dd_5 = divided_difference(x_5, y_5);
disp('Divided difference table for degree 5: ');
disp(dd_5);

% Compute the Newton interpolation polynomial of degree 5
P_5 = newtonInterp(x_5, y_5, dd_5);
disp(['Newton interpolation polynomial of degree 5 P_n: ', char(vpa(P_5, 4))]);

% Evaluate the interpolation polynomial at x = 1.25
x_interp = 1.25;
y_interp = double(subs(P_5, x_interp));
disp(['x_interp: ', num2str(x_interp)]);
disp(['Newton interpolation of degree 5 at x_interp: ', num2str(y_interp)]);

disp('--- Newton interpolation of degree 5 END ---');
