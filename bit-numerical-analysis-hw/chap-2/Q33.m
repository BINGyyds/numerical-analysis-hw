% Define the value of n
n = 10;
matrixType = 'polynomial'; % or 'hilbert'

% Generate the original linear system
[A, b] = generateLinearSystem(n, matrixType);

% Exact solution
x_exact = @(n) ones(n, 1);

% Solve the original system
x_original = A \ b;

% Introduce perturbation
A_perturbed = A;
A_perturbed(2, 2) = A_perturbed(2, 2) + 1e-8;
A_perturbed(n, n) = A_perturbed(n, n) + 1e-8;

% Solve the perturbed system
x_perturbed = A_perturbed \ b;

% Compute relative errors
relative_error_exact = norm(x_original - x_exact(n), inf) / norm(x_exact(n), inf);
relative_error_perturbed = norm(x_perturbed - x_exact(n), inf) / norm(x_exact(n), inf);

% Display the results
fprintf('%s\n', matrixType);
fprintf('Relative error of the exact solution: %.2e\n', relative_error_exact);
fprintf('Relative error of the perturbed solution: %.2e\n', relative_error_perturbed);