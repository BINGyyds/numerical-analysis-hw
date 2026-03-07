% Define the input matrix A and initial guess x0
A = [12, 6, -6; 6, 16, 2; -6, 2, 16];
x0 = [1; 1; 1];

[x_values_pm, lambda_values_pm, iter_pm] = pm(A, x0, 3);

lambda0 = floor(lambda_values_pm(end));

disp('lambda0:');
disp(lambda0);

[x_values_inv, lambda_values_inv, iter_inv] = inv_pm(A, x0, inf, 1e-10, lambda0);

% Output the number of iterations performed
disp('Number of inv_pm iterations performed:');
disp(iter_inv);

disp('First 3 lambda_values:');
disp(lambda_values_inv(1:3) + lambda0);

disp('Latest x_value:');
disp(x_values_inv(:, end));

disp('Latest lambda_value:');
disp(lambda_values_inv(end) + lambda0);

disp('Eigenvalues of A calculated using MATLAB built-in function:');
disp(eig(A));
