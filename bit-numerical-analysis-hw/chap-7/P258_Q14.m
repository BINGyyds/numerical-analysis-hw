f = @(x) sqrt(1 + cos(x) .^ 2);
a = 0;
b = 4;
tolerance = 1e-2;

[result_romb, error_romb] = adaptive_int(f, a, b, 'romberg', tolerance);
fprintf('Romberg: Result = %f, Error = %f\n', result_romb, error_romb);

% Calculate the truncation error
true_value = integral(f, a, b);
truncation_error_romb = abs(true_value - result_romb);

fprintf('Romberg: Truncation Error = %f\n', truncation_error_romb);
