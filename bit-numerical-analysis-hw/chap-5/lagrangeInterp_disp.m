function L = lagrangeInterp_disp(x, y)
    % LAGRANGEINTERP - Computes the Lagrange interpolation polynomial
    % L = lagrangeInterp(x, y) returns a symbolic expression L that represents
    % the Lagrange interpolation polynomial.
    %
    % Inputs:
    %   x - vector of x-coordinates of the data points
    %   y - vector of y-coordinates of the data points
    %
    % Output:
    %   L - symbolic expression for the Lagrange interpolation polynomial

    assert(numel(x) == numel(y), 'x and y must have the same number of elements');

    n = length(x);

    syms z; % Define the symbolic variable

    L = 0; % Initialize the Lagrange polynomial

    for i = 1:n
        % Compute the i-th Lagrange basis polynomial
        Li = 1;

        for j = 1:n

            if i ~= j
                Li = Li * (z - x(j)) / (x(i) - x(j));
            end

        end

        L = L + Li * y(i);
    end

    % L = simplify(L); % Simplify the resulting polynomial
end
