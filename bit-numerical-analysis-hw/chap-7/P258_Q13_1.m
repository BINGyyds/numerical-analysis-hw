f = @(x) 1 ./ (x + cos(x));
a = 0;
b = pi;
tolerance = 3e-4;

[result_trap, error_trap] = adaptive_int(f, a, b, 'trapezoidal', tolerance);
fprintf('Trapezoidal: Result = %f, Error = %f\n', result_trap, error_trap);

[result_simp, error_simp] = adaptive_int(f, a, b, 'simpson', tolerance);
fprintf('Simpson: Result = %f, Error = %f\n', result_simp, error_simp);

[result_romb, error_romb] = adaptive_int(f, a, b, 'romberg', tolerance);
fprintf('Romberg: Result = %f, Error = %f\n', result_romb, error_romb);

% Calculate the truncation error
true_value = integral(f, a, b);
truncation_error_trap = abs(true_value - result_trap);
truncation_error_simp = abs(true_value - result_simp);
truncation_error_romb = abs(true_value - result_romb);

fprintf('Trapezoidal: Truncation Error = %f\n', truncation_error_trap);
fprintf('Simpson: Truncation Error = %f\n', truncation_error_simp);
fprintf('Romberg: Truncation Error = %f\n', truncation_error_romb);
