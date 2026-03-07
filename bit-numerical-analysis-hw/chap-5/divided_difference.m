function dd_table = divided_difference(x, y)
    
    assert(numel(x) == numel(y), 'x and y must have the same number of elements');

    % Number of data points
    n = length(x);

    % Initialize the divided difference table
    dd_table = zeros(n, n);

    % First column is y values
    dd_table(:, 1) = y(:);

    % Compute the divided differences
    for j = 2:n

        for i = 1:(n - j + 1)
            dd_table(i, j) = (dd_table(i + 1, j - 1) - dd_table(i, j - 1)) / (x(i + j - 1) - x(i));
        end

    end

end
