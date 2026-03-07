% Define the input matrix A and initial guess x0
A = [6, -4, 18; 20, -6, -6; 22, -22, 11];
x0 = [1; 1; 1];
max_iter = 1e3;
tol = 1e-6;

for normalize = [false, true]
    disp('Normalize:');
    disp(normalize);

    % Call the power method function
    [x_values, lambda_values, iter] = pm(A, x0, max_iter, tol, 0, normalize);

    disp('Number of iterations performed:');
    disp(iter);

    disp('x_values from 100 to 110:');
    disp(x_values(:, 100:110));

    disp('lambda_values from 100 to 110:');
    disp(lambda_values(100:110));

    disp('Latest lambda_value:');
    disp(lambda_values(end));

    disp('----------------------------------------');
end

disp('Eigenvalues of A calculated using MATLAB built-in function:');
% eig_A = eig(A);
% [~, max_eig_idx] = max(abs(eig_A));
% disp('Maximum eigenvalue of A:');
% disp(eig_A(max_eig_idx));
disp(eig(A));
