% Define the values of n
n_values = [5, 10, 20];
matrixType = 'polynomial'; % or 'hilbert'

% Loop through each value of n
for n = n_values
    % Generate the linear system
    [A, b] = generateLinearSystem(n, matrixType);
    
    % Compute the 2-norm condition number
    cond_num = cond(A, 2);
    
    % Determine if the matrix is ill-conditioned
    if cond_num > 1e10 % Cond(A) >> 1
        result = 'Ill-conditioned';
    else
        result = 'Well-conditioned';
    end
    
    % Display the condition number and the result
    fprintf('%s, n = %d, 2-norm condition number = %.2e, Result: %s\n', matrixType, n, cond_num, result);
end