% Define the coefficient matrix A and the right-hand side vector b
A = [10, 1, 2, 3, 4; 1, 9, -1, 2, -3; 2, -1, 7, 3, -5; 3, 2, 3, 12, -1; 4, -3, -5, -1, 15];
b = [12; -27; 14; -17; 12];

max_iter = inf;
x0 = zeros(size(b));
epsilon = 1e-16;

% Call the Jacobi function
[x, iter, last_error] = jacobi(A, b, max_iter, x0, epsilon);
disp('--- Jacobi Iteration Method Outp. Start ---');
disp('Solution vector x:');
disp(x);
disp('Number of iterations:');
disp(iter);
disp('Error of the last iteration:');
disp(last_error);
disp('--- Jacobi Iteration Method Outp. End ---');

% Call the Gauss-Seidel function
[x, iter, last_error] = gauss_seidel(A, b, max_iter, x0, epsilon);
disp('--- Gauss-Seidel Iteration Method Outp. Start ---');
disp('Solution vector x:');
disp(x);
disp('Number of iterations:');
disp(iter);
disp('Error of the last iteration:');
disp(last_error);
disp('--- Gauss-Seidel Iteration Method Outp. End ---');

% Call the CG function
[x, iter, last_error] = cg(A, b, max_iter, x0, epsilon);
disp('--- CG Method Outp. Start ---');
disp('Solution vector x:');
disp(x);
disp('Number of iterations:');
disp(iter);
disp('Error of the last iteration:');
disp(last_error);
disp('--- CG Method Outp. End ---');