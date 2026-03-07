function [result, error_est] = adaptive_int(f, a, b, method, tolerance)
    % Adaptive integration using successive interval halving.
    %
    % Args:
    %   f:          Function handle to be integrated.
    %   a:          Lower limit of integration.
    %   b:          Upper limit of integration.
    %   method:     Integration method ('trapezoidal', 'simpson', or 'romberg').
    %   tolerance:  Desired error tolerance.
    %
    % Returns:
    %   result:     The approximate value of the definite integral.
    %   error_est:  Estimated error of the approximation.

    % Initial integral approximation
    switch lower(method)
        case 'trapezoidal'
            I_old = (b - a) * (f(a) + f(b)) / 2;
        case 'simpson'
            I_old = (b - a) * (f(a) + 4 * f((a + b) / 2) + f(b)) / 6;
        case 'romberg'
            R(1, 1) = (b - a) * (f(a) + f(b)) / 2; % Initialize Romberg table
            I_old = R(1, 1);
        otherwise
            error('Invalid integration method. Use "trapezoidal", "simpson", or "romberg".');
    end

    n = 1; % Initial number of intervals
    error_est = Inf;

    n = 2 * n;
    h = (b - a) / n;

    while error_est > tolerance
        x = a:h:b;

        switch lower(method)
            case 'trapezoidal'
                I_new = 0.5 * I_old + h * sum(f(x(2:2:end - 1)));
                error_est = abs(I_new - I_old) / 3;
                n = 2 * n;
                h = (b - a) / n;
            case 'simpson'
                I_new = (h / 3) * (f(a) + f(b) + 2 * (sum(f(x(2:2:end - 2)))) + 4 * (sum(f(x(1:2:end - 1)))));
                error_est = abs(I_new - I_old) / 15;
                n = 2 * n;
                h = (b - a) / n;
            case 'romberg'
                h = (b - a) / 2 ^ (n - 1);

                % Improved Trapezoidal Rule
                sum_f = 0;

                for j = 1:2 ^ (n - 2)
                    sum_f = sum_f + f(a + (2 * j - 1) * h);
                end

                R(n, 1) = 0.5 * R(n - 1, 1) + h * sum_f;

                % Extrapolation
                for j = 2:n
                    R(n, j) = (4 ^ (j - 1) * R(n, j - 1) - R(n - 1, j - 1)) / (4 ^ (j - 1) - 1);
                end

                I_new = R(n, n);
                error_est = abs(R(n, n) - R(n - 1, n - 1)); % More accurate error estimate

                n = n + 1;
            otherwise
                error('Invalid integration method.');
        end

        I_old = I_new;

    end

    result = I_new;

end
