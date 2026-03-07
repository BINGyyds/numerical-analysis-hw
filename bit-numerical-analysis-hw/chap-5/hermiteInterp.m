function P = hermiteInterp(x, y, yp)
    % hermiteInterp - Computes the Hermite interpolating polynomial
    % only for the case where the first derivative is given
    % Inputs:
    %   x - vector of x data points
    %   y - vector of y data points
    %   yp - vector of y' (derivative) data points
    % Output:
    %   P - symbolic expression of the Hermite interpolating polynomial

    n = length(x);

    if length(y) ~= n || length(yp) ~= n
        error('x, y, and yp must be the same length');
    end

    % Construct the Hermite divided difference table
    z = zeros(2 * n, 1);
    Q = zeros(2 * n, 2 * n);

    for i = 1:n
        z(2 * i - 1) = x(i);
        z(2 * i) = x(i);
        Q(2 * i - 1, 1) = y(i);
        Q(2 * i, 1) = y(i);
        Q(2 * i, 2) = yp(i);

        if i ~= 1
            Q(2 * i - 1, 2) = (Q(2 * i - 1, 1) - Q(2 * i - 2, 1)) / (z(2 * i - 1) - z(2 * i - 2));
        end

    end

    for i = 3:2 * n

        for j = 3:i
            Q(i, j) = (Q(i, j - 1) - Q(i - 1, j - 1)) / (z(i) - z(i - j + 1));
        end

    end

    % Construct the Hermite interpolating polynomial
    syms t;
    P = Q(1, 1);
    term = 1;

    for k = 1:2 * n - 1
        term = term * (t - z(k));
        P = P + Q(k + 1, k + 1) * term;
    end

    % P = simplify(P);
end
