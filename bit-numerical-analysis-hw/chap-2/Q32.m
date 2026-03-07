% Define the values of n
n_values = [5, 10, 20];
matrixTypes = {'polynomial', 'hilbert'};

% Exact solution
x_exact = @(n) ones(n, 1);

% Loop through each matrix type and value of n
for matrixType = matrixTypes
    for n = n_values
        % Generate the linear system
        [A, b] = generateLinearSystem(n, matrixType{1});
        
        % Solve the linear system
        x_approx = A \ b;
        
        % Compute the relative error using the infinity norm
        rel_error = norm(x_approx - x_exact(n), inf) / norm(x_exact(n), inf);
        
        % Display the relative error
        fprintf('%s, n = %d, Relative Error (inf-norm) = %.2e\n', matrixType{1}, n, rel_error);
    end
end