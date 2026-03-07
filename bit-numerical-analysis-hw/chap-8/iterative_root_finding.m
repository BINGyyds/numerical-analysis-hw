function [result, n, error] = iterative_root_finding(phi, x0, tolerance, method, varargin)
    % Iterative methods for finding the root of a function.

    % Inputs:
    %   phi:        Iteration function handle (@(x) ...).
    %   x0:         Initial guess.
    %   tolerance:  Error tolerance.
    %   method:     'simple' or 'newton'.
    %   varargin:   Variable arguments depending on the method:
    %               For 'simple':
    %                   acceleration: 'none', 'steffensen', or 'lambda'.
    %                   lambda (optional):  Relaxation parameter for 'lambda' acceleration.
    %               For 'newton':
    %                   f:          Function handle for Newton's method.
    %                   df (optional): Derivative of f. If not provided, secant method is used.

    % Outputs:
    %   result:     Approximated root.
    %   n:          Number of iterations.
    %   error:      Error estimate.

    max_iterations = 1000;
    n = 0;
    x = x0;

    switch lower(method)
        case 'simple'
            acceleration = varargin{1};

            if strcmpi(acceleration, 'lambda')
                lambda = varargin{2};
            end

            while true
                n = n + 1;
                x_old = x;

                switch lower(acceleration)
                    case 'none'
                        x = phi(x);
                    case 'steffensen'
                        x1 = phi(x);
                        x2 = phi(x1);
                        x = x - (x1 - x) ^ 2 / (x2 - 2 * x1 + x);
                    case 'lambda'
                        x = lambda * phi(x) + (1 - lambda) * x;
                end

                error = abs(x - x_old);

                if error < tolerance || n >= max_iterations
                    break;
                end

            end

        case 'newton'
            f = varargin{1};

            if length(varargin) > 1
                df = varargin{2};
                phi = @(x) x - f(x) / df(x); % Newton's method

                while true
                    n = n + 1;
                    x_old = x;
                    x = phi(x);
                    error = abs(x - x_old);

                    if error < tolerance || n >= max_iterations
                        break;
                    end

                end

            else
                x_prev = x0(1);
                x = x0(2);
                phi = @(x_curr, x_prev) x_curr - f(x_curr) * (x_curr - x_prev) / (f(x_curr) - f(x_prev)); % Secant method

                while true
                    n = n + 1;
                    x_next = phi(x, x_prev);
                    error = abs(x_next - x);

                    if error < tolerance || n >= max_iterations
                        break;
                    end

                    x_prev = x;
                    x = x_next;

                end

            end

        otherwise
            error('Invalid method specified.');
    end

    if n >= max_iterations
        error('Method did not converge within maximum iterations.');
    end

    result = x;

end
