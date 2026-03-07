function result = composite_int(f, a, b, method, n)
    % Composite integration using trapezoidal or Simpson's rule.
    %
    % Args:
    %   f:      Function handle to be integrated.
    %   a:      Lower limit of integration.
    %   b:      Upper limit of integration.
    %   method: Integration method ('trapezoidal' or 'simpson').
    %   n:      Number of subintervals.
    %
    % Returns:
    %   result: The approximate value of the definite integral.

    h = (b - a) / n;
    x = a:h:b; % Generate equally spaced points

    switch lower(method)
        case 'trapezoidal'
            result = h / 2 * (f(x(1)) + 2 * sum(f(x(2:end - 1))) + f(x(end)));

        case 'simpson'

            if mod(n, 2) ~= 0
                error('Number of subintervals (n) must be even for Simpson''s rule.');
            end

            result = h / 3 * (f(x(1)) + 4 * sum(f(x(2:2:end - 1))) + 2 * sum(f(x(3:2:end - 2))) + f(x(end)));

        otherwise
            error('Invalid integration method. Use "trapezoidal" or "simpson".');
    end

end
