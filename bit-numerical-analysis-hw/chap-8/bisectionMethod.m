function [result, k, process] = bisectionMethod(f, a0, b0, tolerance)
    % Implements the bisection method to find a root of the function f within the interval [a0, b0].

    % Input:
    %   f:          The function handle for which to find a root.
    %   a0:         The left endpoint of the initial interval.
    %   b0:         The right endpoint of the initial interval.
    %   tolerance:  The desired tolerance (stopping criterion).

    % Output:
    %   result:    The approximate root of the function.
    %   k:         The number of iterations performed.
    %   process:   A matrix storing the values of ak, (ak+bk)/2, bk, f(ak), f((ak+bk)/2), and f(bk) at each iteration.

    % Check if the interval brackets a root
    if f(a0) * f(b0) > 0
        error('Function values at the interval endpoints must have opposite signs.');
    end

    % Calculate the number of iterations needed
    k = ceil(log2((b0 - a0) / tolerance));

    % Initialize the process matrix
    process = zeros(k, 6);

    % Bisection method iterations
    a = a0;
    b = b0;

    for i = 1:k
        c = (a + b) / 2;
        process(i, :) = [a, c, b, f(a), f(c), f(b)];

        if f(c) == 0
            result = c;
            return;
        elseif f(a) * f(c) < 0
            b = c;
        else
            a = c;
        end

    end

    result = (a + b) / 2;

end
