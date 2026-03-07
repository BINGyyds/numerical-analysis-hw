% Define the function to be integrated
f = @(x) exp(-x .^ 2);

% Integration limits
a = 0;
b = 1;

% Number of subintervals
n = 10; % Try different values of n

% Calculate the integral using the trapezoidal rule
result_trapezoidal = composite_int(f, a, b, 'trapezoidal', n);
fprintf('Trapezoidal rule result: %f\n', result_trapezoidal);

% Calculate the integral using Simpson's rule
result_simpson = composite_int(f, a, b, 'simpson', n);
fprintf('Simpson''s rule result: %f\n', result_simpson);

% Calculate the exact value of the integral
exact_value = integral(f, a, b);

% Calculate the truncation error for the trapezoidal rule
error_trapezoidal = abs(exact_value - result_trapezoidal);
fprintf('Trapezoidal rule truncation error: %e\n', error_trapezoidal);

% Calculate the truncation error for Simpson's rule
error_simpson = abs(exact_value - result_simpson);
fprintf('Simpson''s rule truncation error: %e\n', error_simpson);

% Define the second derivative of the function
f2 = @(x) -2 * exp(-x .^ 2) + 4 * x .^ 2 .* exp(-x .^ 2);

% Calculate the maximum value of the second derivative on [a, b]
x_vals = linspace(a, b, 1000);
max_f2 = max(abs(f2(x_vals)));

% Estimate the error for the trapezoidal rule
error_est_trapezoidal = ((b - a) ^ 3 / (12 * n ^ 2)) * max_f2;
fprintf('Estimated trapezoidal rule error: %e\n', error_est_trapezoidal);

% Define the fourth derivative of the function for Simpson's rule error estimation
f4 = @(x) (16 * x .^ 4 - 48 * x .^ 2 + 12) .* exp(-x .^ 2);

% Calculate the maximum value of the fourth derivative on [a, b]
max_f4 = max(abs(f4(x_vals)));

% Estimate the error for Simpson's rule
error_est_simpson = ((b - a) ^ 5 / (180 * n ^ 4)) * max_f4;
fprintf('Estimated Simpson''s rule error: %e\n', error_est_simpson);
