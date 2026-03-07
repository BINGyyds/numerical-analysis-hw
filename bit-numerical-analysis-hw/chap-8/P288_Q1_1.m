f = @(x) x - log(x) - 2;
a0 = 2;
b0 = 4;
tolerance = 1e-5;

[root, iterations, process_data] = bisectionMethod(f, a0, b0, tolerance);

fprintf('Approximate root: %f\n', root);
fprintf('Number of iterations: %d\n', iterations);

% Compare the results
root_fzero = fzero(f, [a0, b0]);
fprintf('Root using fzero: %f\n', root_fzero);
fprintf('Difference between methods: %e\n', abs(root - root_fzero));

disp('Process data (a, c, b, f(a), f(c), f(b)):');
disp(process_data);
