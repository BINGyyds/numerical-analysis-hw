% Define the input matrix A and initial guess x0
A = [1, 2, 3; 2, 3, 4; 3, 4, 5];
x0 = [1; 0; 0];
max_iter = inf;
lambda0 = 9.6;

% Call the power method function
[x_values, lambda_values, iter] = inv_pm(A, x0, max_iter, 1e-16, lambda0);

% Output the number of iterations performed
disp('Number of iterations performed:');
disp(iter);

% Output the first 3 of x_values and lambda_values
disp('First 3 x_values:');
disp(x_values(:, 1:3));

disp('First 3 lambda_values:');
disp(lambda_values(1:3) + lambda0);

% Output the latest x_value and lambda_value
disp('Latest x_value:');
disp(x_values(:, end));

disp('Latest lambda_value:');
disp(lambda_values(end) + lambda0);
