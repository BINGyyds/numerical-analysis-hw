function [x_values, lambda_values, iter] = pm(A, x0, max_iter, tol, lambda0, normalize)
    % Power Method for finding the dominant eigenvalue and eigenvector.
    %
    % [x_values, lambda_values] = pm(A, x0, max_iter, tol, lambda0, normalize)
    %
    % Parameters:
    %   A         - The input matrix for which the dominant eigenvalue and eigenvector are to be found.
    %   x0        - The initial guess for the eigenvector.
    %   max_iter  - (Optional) The maximum number of iterations to perform. Default is inf.
    %   tol       - (Optional) The tolerance for convergence. Default is 0.
    %   lambda0   - (Optional) The initial guess for the eigenvalue shift. Default is 0.
    %   normalize - (Optional) Whether to normalize the eigenvector at each iteration. Default is true.
    %
    % Returns:
    %   x_values      - The matrix of eigenvector approximations at each iteration.
    %   lambda_values - The vector of eigenvalue approximations at each iteration.
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

    if nargin < 6
        normalize = true;
    end

    x = x0;
    lambda = lambda0; % shift value
    iter = 0;

    A = A - lambda0 * eye(size(A)); % Shift the matrix A by lambda0

    x_values = x0; % Initialize x_values with the initial x0
    lambda_values = lambda0; % Initialize lambda_values with the initial lambda0

    while iter < max_iter
        iter = iter + 1;
        if normalize
            [~, idx] = max(abs(x));
            x = x / x(idx);
        end
        x = A * x;

        if normalize
            [~, idx] = max(abs(x));
            lambda_new = x(idx); % lambda_new = x' * A * x / (x' * x);
        else
            lambda_new = x' * A * x / (x' * x);
        end

        % Save the current values of x and lambda
        x_values(:, iter + 1) = x / lambda_new;
        lambda_values(iter + 1) = lambda_new + lambda0;

        % Check for convergence
        if tol > 0

            if abs(lambda_new - lambda) < tol
                return;
            end

        end

        lambda = lambda_new;
    end

    if tol > 0
        warning('Power method did not converge within the maximum number of iterations');
    end

end
