% Define the original function
f = @(x) 2 .^ x;
disp(['Original function f: ', func2str(f)]);

% Define the interpolation points
x = [0, 1];
% x = [-1, 0, 1];
y = f(x);
disp(['Interpolation points x: ', num2str(x)]);
disp(['Function values at interpolation points y = f(x): ', num2str(y)]);

disp('--- Lagrange interpolation ---');

% Compute the Lagrange interpolation polynomial
L = lagrangeInterp_disp(x, y);
disp(['Lagrange interpolation polynomial L_n: ', char(L)]);

% Evaluate the interpolation polynomial at x = 0.3
x_interp = 0.3;
y_interp = double(subs(L, x_interp));
disp(['x_interp: ', num2str(x_interp)]);
disp(['Lagrange interpolation at x_interp: ', num2str(y_interp)]);

% Compute the (n+1)-th derivative of the original function
syms xs;
n = length(x) - 1;
f_sym = 2 ^ xs;
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
