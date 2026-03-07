% Define the input matrix A and initial guess x0
A = [-4, 14, 0; -5, 13, 0; -1, 0, 2];
% A = [4, -1, 1; -1, 3, -2; 1, -2, 3];
x0 = [1; 0; 0];
max_iter = 10;

disp('A:');
disp(A);

% Call the power method function
[x_values, lambda_values, iter] = pm(A, x0, max_iter);

% Output the number of iterations performed
disp('Number of iterations performed:');
disp(iter);

% Output the first 3 of x_values and lambda_values
disp('First 3 x_values:');
disp(x_values(:, 1:3));

disp('First 3 lambda_values:');
disp(lambda_values(1:3));

% Output the latest x_value and lambda_value
disp('Latest x_value:');
disp(x_values(:, end));

disp('Latest lambda_value:');
disp(lambda_values(end));
