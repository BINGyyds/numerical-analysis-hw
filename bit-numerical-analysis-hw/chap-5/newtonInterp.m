function P = newtonInterp(x, y, dd)
    % newtonInterp - Computes the Newton interpolating polynomial
    % Inputs:
    %   x - vector of x data points
    %   y - vector of y data points
    %   dd - divided difference table
    % Output:
    %   P - symbolic expression of the Newton interpolating polynomial

    n = length(x);

    if length(y) ~= n
        error('x and y must be the same length');
    end

    % Construct the Newton interpolating polynomial
    syms t;
    P = dd(1, 1);
    term = 1;

    for k = 1:n - 1
        term = term * (t - x(k));
        P = P + dd(1, k + 1) * term;
    end

    % P = simplify(P);
end
