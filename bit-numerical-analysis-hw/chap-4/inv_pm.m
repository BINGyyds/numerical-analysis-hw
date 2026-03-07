function [x_values, lambda_values, iter] = inv_pm(A, x0, max_iter, tol, lambda0)
    % Inverse Power Method for finding the smallest eigenvalue and eigenvector.
    %
    % [x_values, lambda_values] = inv_pm(A, x0, max_iter, tol, lambda0)
    %
    % Parameters:
    %   A         - The input matrix for which the dominant eigenvalue and eigenvector are to be found.
    %   x0        - The initial guess for the eigenvector.
    %   max_iter  - (Optional) The maximum number of iterations to perform. Default is inf.
    %   tol       - (Optional) The tolerance for convergence. Default is 0.
    %   lambda0   - (Optional) The initial guess for the eigenvalue shift. Default is 0.
    %
    % Returns:
    %   x_values      - The matrix of eigenvector approximations of inverse of shifted matrix A at each iteration.
    %   lambda_values - The vector of smallest eigenvalue approximations of shifted matrix A at each iteration.
    %   iter          - The number of iterations performed.

    if nargin < 3
        max_iter = inf;
    end

    if nargin < 4
        tol = 0;
    end

    if nargin < 5
        lambda0 = 0;
    end

    x = x0;
    lambda = lambda0; % shift value
    iter = 0;

    A = A - lambda0 * eye(size(A)); % Shift the matrix A by lambda0

    x_values = x0; % Initialize x_values with the initial x0
    lambda_values = lambda0; % Initialize lambda_values with the initial lambda0

    while iter < max_iter
        iter = iter + 1;
        [~, idx] = max(abs(x));
        x = x / x(idx);
        % x = A \ x;
        [L, U] = lu(A);
        y = L \ x;
        x = U \ y;

        [~, idx] = max(abs(x));
        lambda_new = x(idx); % lambda_new = x' * A * x / (x' * x);

        % Save the current values of x and lambda
        x_values(:, iter + 1) = x / lambda_new;
        lambda_values(iter + 1) = 1 / lambda_new;

        % Check for convergence
        if tol > 0

            if abs(1 / lambda_new - 1 / lambda) < tol
                return;
            end

        end

        lambda = lambda_new;
    end

    if tol > 0
        warning('Inv power method did not converge within the maximum number of iterations');
    end

end
