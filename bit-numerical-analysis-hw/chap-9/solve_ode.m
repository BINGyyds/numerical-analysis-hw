function [x, y] = solve_ode(f, y0, a, b, h, method)

    % Solves an ordinary differential equation (ODE) numerically using either the Euler method or the improved Euler method.

    % Inputs:
    %   f:      Function handle representing the ODE, y' = f(x, y)
    %   y0:     Initial condition y(a) = y0
    %   a:      Start of the interval
    %   b:      End of the interval
    %   h:      Step size
    %   method: 'euler' (default) or 'improved_euler'

    % Outputs:
    %   x:      Vector of x values
    %   y:      Vector of corresponding y values (numerical solution)

    if nargin < 6
        method = 'euler';
    end

    x = a:h:b;
    n = length(x);
    y = zeros(1, n);
    y(1) = y0;

    switch lower(method)
        case 'euler'

            for i = 1:n - 1
                y(i + 1) = y(i) + h * f(x(i), y(i));
            end

        case 'improved_euler'

            for i = 1:n - 1
                p = y(i) + h * f(x(i), y(i));
                q = y(i) + h * f(x(i + 1), p);
                y(i + 1) = (p + q) / 2;
            end

        otherwise
            error('Invalid method specified. Choose ''euler'' or ''improved_euler''.');
    end

end
