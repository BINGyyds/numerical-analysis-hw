% Simple iteration with no acceleration:
phi = @(x) 1 + 1 / x ^ 2;
[result, n, error] = iterative_root_finding(phi, 1.5, (1e-4) / 2, 'simple', 'none');

fprintf('Simple iteration with no acceleration:\n');
fprintf('Approximated root: %f\n', result);
fprintf('Number of iterations: %d\n', n);
fprintf('Error estimate: %e\n\n', error);

% Compare the results
f = @(x) x ^ 3 - x ^ 2 - 1;
root_fzero = fzero(f, [1, 2]);
fprintf('Root using fzero: %f\n', root_fzero);
fprintf('Difference between methods: %e\n', abs(result - root_fzero));

% Simple iteration with Steffensen acceleration:
[result, n, error] = iterative_root_finding(phi, 1.5, (1e-4) / 2, 'simple', 'steffensen');

fprintf('\nSimple iteration with Steffensen acceleration:\n');
fprintf('Approximated root: %f\n', result);
fprintf('Number of iterations: %d\n', n);
fprintf('Error estimate: %e\n\n', error);

% Compare the results
fprintf('Root using fzero: %f\n', root_fzero);
fprintf('Difference between methods: %e\n', abs(result - root_fzero));

% Simple iteration with lambda acceleration:
[result, n, error] = iterative_root_finding(phi, 1.5, (1e-4) / 2, 'simple', 'lambda', 0.625);

fprintf('\nSimple iteration with lambda acceleration:\n');
fprintf('Approximated root: %f\n', result);
fprintf('Number of iterations: %d\n', n);
fprintf('Error estimate: %e\n\n', error);

% Compare the results
fprintf('Root using fzero: %f\n', root_fzero);
fprintf('Difference between methods: %e\n', abs(result - root_fzero));

% Newton's method:
f = @(x) x ^ 3 - x ^ 2 - 1;
df = @(x) 3 * x ^ 2 - 2 * x;
[result, n, error] = iterative_root_finding([], 1.5, (1e-4) / 2, 'newton', f, df);

fprintf('\nNewton''s method:\n');
fprintf('Approximated root: %f\n', result);
fprintf('Number of iterations: %d\n', n);
fprintf('Error estimate: %e\n\n', error);

% Compare the results
fprintf('Root using fzero: %f\n', root_fzero);
fprintf('Difference between methods: %e\n', abs(result - root_fzero));

% Newton's method with secant (no df provided):
[result, n, error] = iterative_root_finding([], [1, 2], (1e-4) / 2, 'newton', f);

fprintf('\nNewton''s method with secant (no df provided):\n');
fprintf('Approximated root: %f\n', result);
fprintf('Number of iterations: %d\n', n);
fprintf('Error estimate: %e\n\n', error);

% Compare the results
fprintf('Root using fzero: %f\n', root_fzero);
fprintf('Difference between methods: %e\n', abs(result - root_fzero));
