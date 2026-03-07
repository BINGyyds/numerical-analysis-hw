function [x, iter, last_error] = cg(A, b, max_iter, x0, tol)
    % Conjugate Gradient Method
    % Inputs:
    % A - Coefficient matrix (must be symmetric positive definite)
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
    % disp('--- Conjugate Gradient Method Conf. Start ---');
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
    % disp('--- Conjugate Gradient Method Conf. End ---');

    % Initial guess
    x = x0;
    r = b - A * x;
    p = r;
    rsold = r' * r;
    iter = 0;
    last_error = inf;

    for k = 1:max_iter
        Ap = A * p;
        alpha = rsold / (p' * Ap);
        x = x + alpha * p;
        r = r - alpha * Ap; % r = b - A * x
        rsnew = r' * r;
        last_error = sqrt(rsnew);

        % Check for convergence
        if tol > 0
            if last_error < tol
                iter = k;
                return;
            end
        end

        p = r + (rsnew / rsold) * p;
        rsold = rsnew;
        iter = k;
    end

    warning('Conjugate Gradient method did not converge within the maximum number of iterations');
end