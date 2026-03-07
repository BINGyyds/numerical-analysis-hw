function [A, b] = generateLinearSystem(n, matrixType)
    % This function generates the coefficient matrix A and the vector b for
    % the linear system Ax = b. The parameter n specifies the size of the
    % matrix, and matrixType specifies the type of matrix to generate.
    %
    % matrixType can be:
    % 'polynomial' - A is generated using a_{i j} = x_i^{j-1} where x_i = 1 + 0.1 * i
    % 'hilbert'    - A is generated using a_{i j} = 1 / (i + j - 1)

    if strcmp(matrixType, 'polynomial')
        % Generate polynomial matrix
        A = zeros(n);
        for i = 1:n
            x_i = 1 + 0.1 * i;
            for j = 1:n
                A(i, j) = x_i^(j-1);
            end
        end
    elseif strcmp(matrixType, 'hilbert')
        % Generate Hilbert matrix
        A = zeros(n);
        for i = 1:n
            for j = 1:n
                A(i, j) = 1 / (i + j - 1);
            end
        end
    else
        error('Invalid matrix type. Use ''polynomial'' or ''hilbert''.');
    end

    % Compute vector b
    b = sum(A, 2);
end