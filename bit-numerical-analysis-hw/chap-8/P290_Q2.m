% Simple iteration with no acceleration:
phi = @(x) exp(-x);
[result, n, error] = iterative_root_finding(phi, .5, 1e-8, 'simple', 'none');

fprintf('Simple iteration with no acceleration:\n');
fprintf('Approximated root: %f\n', result);
fprintf('Number of iterations: %d\n', n);
fprintf('Error estimate: %e\n\n', error);

% Compare the results
f = @(x) x - exp(-x);
root_fzero = fzero(f, [0, 1]);
fprintf('Root using fzero: %f\n', root_fzero);
fprintf('Difference between methods: %e\n', abs(result - root_fzero));

% Simple iteration with lambda acceleration:
[result, n, error] = iterative_root_finding(phi, .5, 1e-8, 'simple', 'lambda', 0.625);

fprintf('\nSimple iteration with lambda acceleration:\n');
fprintf('Approximated root: %f\n', result);
fprintf('Number of iterations: %d\n', n);
fprintf('Error estimate: %e\n\n', error);

% Compare the results
fprintf('Root using fzero: %f\n', root_fzero);
fprintf('Difference between methods: %e\n', abs(result - root_fzero));
