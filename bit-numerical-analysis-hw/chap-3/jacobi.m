function [x, iter, last_error] = jacobi(A, b, max_iter, x0, tol)
    % Jacobi Iteration Method
    % Inputs:
    % A - Coefficient matrix
    % b - Right-hand side vector
    % max_iter - Maximum number of iterations
    % x0 - Initial guess (optional)
    % tol - Tolerance for convergence (optional)
    % Outputs:
    % x - Solution vector
    % iter - Number of iterations performed
    % last_error - Error of the last iteration

    % Set default initial guess
    if nargin < 4 || isempty(x0)
        x0 = zeros(size(b));
    end

    % Set default tolerance
    if nargin < 5 || isempty(tol)
        tol = 0;
    end

    % % disp the inputs
    % disp('--- Jacobi Iteration Method Conf. Start ---');
    % disp('Coefficient matrix A:');
    % disp(A);
    % disp('Right-hand side vector b:');
    % disp(b);
    % disp('Maximum number of iterations:');
    % disp(max_iter);
    % disp('Initial guess x0:');
    % disp(x0);
    % disp('Tolerance for convergence:');
    % disp(tol);
    % disp('--- Jacobi Iteration Method Conf. End ---');

    % Initial guess
    x = x0;
    n = length(b);
    iter = 0;
    last_error = inf;
    
    % Iterate
    for k = 1:max_iter
        x_new = zeros(size(x));
        for i = 1:n
            sum = 0;
            for j = 1:n
                if j ~= i
                    sum = sum + A(i, j) * x(j);
                end
            end
            x_new(i) = (b(i) - sum) / A(i, i);
        end
        
        % Check for convergence
        last_error = norm(x_new - x, inf);
        if tol > 0
            if last_error < tol
                x = x_new;
                iter = k;
                return;
            end
        end
        
        x = x_new;
        iter = k;
    end
    
    warning('Jacobi method did not converge within the maximum number of iterations');
end