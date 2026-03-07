function [x, iter, last_error] = sor(A, b, omega, max_iter, x0, tol)
    % Successive Over-Relaxation (SOR) Iteration Method
    % Inputs:
    % A - Coefficient matrix
    % b - Right-hand side vector
    % omega - Relaxation factor
    % max_iter - Maximum number of iterations
    % x0 - Initial guess (optional)
    % tol - Tolerance for convergence (optional)
    % Outputs:
    % x - Solution vector
    % iter - Number of iterations performed
    % last_error - Error of the last iteration

    % Set default initial guess
    if nargin < 5 || isempty(x0)
        x0 = zeros(size(b));
    end

    % Set default tolerance
    if nargin < 6 || isempty(tol)
        tol = 0;
    end

    % % disp the inputs
    % disp('--- SOR Iteration Method Conf. Start ---');
    % disp('Coefficient matrix A:');
    % disp(A);
    % disp('Right-hand side vector b:');
    % disp(b);
    % disp('Relaxation factor omega:');
    % disp(omega);
    % disp('Maximum number of iterations:');
    % disp(max_iter);
    % disp('Initial guess x0:');
    % disp(x0);
    % disp('Tolerance for convergence:');
    % disp(tol);
    % disp('--- SOR Iteration Method Conf. End ---');

    % Initial guess
    x = x0;
    n = length(b);
    iter = 0;
    last_error = inf;
    
    % Iterate
    for k = 1:max_iter
        x_old = x;
        for i = 1:n
            sum1 = 0;
            sum2 = 0;
            for j = 1:i-1
                sum1 = sum1 + A(i, j) * x(j);
            end
            for j = i+1:n
                sum2 = sum2 + A(i, j) * x_old(j);
            end
            x(i) = (1 - omega) * x_old(i) + omega * (b(i) - sum1 - sum2) / A(i, i);
        end
        
        % Check for convergence
        last_error = norm(x - x_old, inf);
        if tol > 0
            if last_error < tol
                iter = k;
                return;
            end
        end
        
        iter = k;
    end
    
    warning('SOR method did not converge within the maximum number of iterations');
end