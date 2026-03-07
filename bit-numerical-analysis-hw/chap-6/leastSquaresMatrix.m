function [A, b] = leastSquaresMatrix(x, y, m)

    assert(length(x) == length(y), 'The lengths of x and y must be the same.');

    n = length(x);

    A = zeros(m + 1, m + 1);
    b = zeros(m + 1, 1);

    for i = 1:m + 1

        for j = 1:m + 1

            for k = 1:n
                A(i, j) = A(i, j) + x(k) ^ (i - 1 + j - 1);
            end

        end

        for k = 1:n
            b(i) = b(i) + y(k) * x(k) ^ (i - 1);
        end

    end

end
