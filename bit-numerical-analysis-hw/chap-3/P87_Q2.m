% Define the coefficient matrix A and the right-hand side vector b
A = [2, -1, 0, 0; -1, 2, -1, 0; 0, -1, 2, -1; 0, 0, -1, 2];
b = [1; 0; 1; 0];

% Call the Jacobi function
for max_iter = [1, 2, 3, inf]
    [x, iter, last_error] = jacobi(A, b, max_iter, ones(size(b)), 1e-3);
    disp('--- Jacobi Iteration Method Outp. Start ---');
    disp('Solution vector x:');
    disp(x);
    disp('Number of iterations:');
    disp(iter);
    disp('Error of the last iteration:');
    disp(last_error);
    disp('--- Jacobi Iteration Method Outp. End ---');
end

% Call the Gauss-Seidel function
for max_iter = [1, 2, 3, inf]
    [x, iter, last_error] = gauss_seidel(A, b, max_iter, ones(size(b)), 1e-3);
    disp('--- Gauss-Seidel Iteration Method Outp. Start ---');
    disp('Solution vector x:');
    disp(x);
    disp('Number of iterations:');
    disp(iter);
    disp('Error of the last iteration:');
    disp(last_error);
    disp('--- Gauss-Seidel Iteration Method Outp. End ---');
end

% Call the SOR function
for max_iter = [1, 2, 3, inf]
    [x, iter, last_error] = sor(A, b, 1.46, max_iter, ones(size(b)), 1e-3);
    disp('--- SOR Iteration Method Outp. Start ---');
    disp('Solution vector x:');
    disp(x);
    disp('Number of iterations:');
    disp(iter);
    disp('Error of the last iteration:');
    disp(last_error);
    disp('--- SOR Iteration Method Outp. End ---');
end