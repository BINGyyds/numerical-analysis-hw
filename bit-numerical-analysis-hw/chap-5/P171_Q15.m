% Define the original function
syms xs
f_sym = 3 * xs * exp(xs) - exp(2 * xs);
disp(['Original function f: ', char(f_sym)]);

% Define the interpolation points
x = [1.0, 1.05];
y = double(subs(f_sym, x));
disp(['Interpolation points x: ', num2str(x)]);
disp(['Function values at interpolation points y = f(x): ', num2str(y)]);

disp('--- Hermite interpolation ---');

% Compute the derivative values at the interpolation points
f_sym_diff = diff(f_sym);
yp = double(subs(f_sym_diff, x));
disp(['f_sym_diff: ', char(f_sym_diff)]);
disp(['Derivative values at interpolation points yp = f(x): ', num2str(yp)]);

% Compute the Hermite interpolation polynomial
H = hermiteInterp(x, y, yp);
disp(['Hermite interpolation polynomial H_m: ', char(vpa(H, 4))]);

% Evaluate the interpolation polynomial at x = 1.03
x_interp = 1.03;
y_interp = double(subs(H, x_interp));
disp(['x_interp: ', num2str(x_interp)]);
disp(['Hermite interpolation at x_interp: ', num2str(y_interp)]);

% Compute the (m+1)-th derivative of the original function
m1 = length(x);
m2 = length(y);
m = m1 + m2 - 1;
f_derivative = diff(f_sym, m + 1);
disp(['m: ', num2str(m)]);
disp(['(m+1)-th derivative of the original function: ', char(f_derivative)]);

% Compute prob((x-x_i)^2)/(m+1)! at x_interp
product_term = prod((x_interp - x) .^ 2);
factorial_term = factorial(m + 1);
result = product_term / factorial_term;
disp(['prob((x-x_i)^2)/(m+1)! at x_interp: ', num2str(result)]);

% Evaluate the error
zeta = (x(end) + x(1)) / 2;
error_bound = double(subs(f_derivative, zeta)) * result;
disp(['zeta: ', num2str(zeta)]);
disp(['Error bound: ', num2str(error_bound)]);
