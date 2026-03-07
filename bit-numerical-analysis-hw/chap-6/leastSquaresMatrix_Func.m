function [A, b] = leastSquaresMatrix_Func(H, g, int_a, int_b)
    % Number of basis functions
    n = length(H);

    % Initialize A and b
    A = zeros(n, n);
    b = zeros(n, 1);

    % Compute matrix A
    for i = 1:n

        for j = 1:n
            A(i, j) = integral(@(x) H{i}(x) .* H{j}(x), int_a, int_b, 'ArrayValued', true);
        end

    end

    % Compute vector b
    for i = 1:n
        b(i) = integral(@(x) H{i}(x) .* g(x), int_a, int_b, 'ArrayValued', true);
    end

end
