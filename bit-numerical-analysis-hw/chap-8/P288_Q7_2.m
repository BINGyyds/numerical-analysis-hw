% Simple iteration with no acceleration:
phi = @(x) 4 + 2 * cos(x) / 3;
[result, n, error] = iterative_root_finding(phi, 4, (1e-5) / 2, 'simple', 'none');

fprintf('Simple iteration with no acceleration:\n');
fprintf('Approximated root: %f\n', result);
fprintf('Number of iterations: %d\n', n);
fprintf('Error estimate: %e\n\n', error);

% Compare the results
f = @(x) 12 - 3 * x + 2 * cos(x);
root_fzero = fzero(f, [3, 5]);
fprintf('Root using fzero: %f\n', root_fzero);
fprintf('Difference between methods: %e\n', abs(result - root_fzero));
