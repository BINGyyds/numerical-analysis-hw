function L = lagrangeInterp(x, y)
    % LAGRANGEINTERP - Computes the Lagrange interpolation polynomial
    % L = lagrangeInterp(x, y) returns a function handle L that evaluates
    % the Lagrange interpolation polynomial at any given point.
    %
    % Inputs:
    %   x - vector of x-coordinates of the data points
    %   y - vector of y-coordinates of the data points
    %
    % Output:
    %   L - function handle for the Lagrange interpolation polynomial

    assert(numel(x) == numel(y), 'x and y must have the same number of elements');

    n = length(x);

    L = @(z) 0; % Initialize the Lagrange polynomial as a function handle

    for i = 1:n
        % Compute the i-th Lagrange basis polynomial
        Li = @(z) 1;

        for j = 1:n

            if j ~= i
                Li = @(z) Li(z) .* (z - x(j)) / (x(i) - x(j));
            end

        end

        % Add the i-th term to the Lagrange polynomial
        L = @(z) L(z) + y(i) * Li(z);
    end

end
