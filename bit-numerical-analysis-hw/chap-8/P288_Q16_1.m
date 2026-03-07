% Newton's method with secant (no df provided):
f = @(x) x - log(x) - 2;
a = 1/8;
b = 1;
[result, n, error] = iterative_root_finding([], [a, b], 1e-5, 'newton', f);

fprintf('f(a) = %f\n', f(a));
fprintf('f(b) = %f\n', f(b));

fprintf('\nNewton''s method with secant (no df provided):\n');
fprintf('Approximated root: %f\n', result);
fprintf('Number of iterations: %d\n', n);
fprintf('Error estimate: %e\n\n', error);

% Compare the results
root_fzero = fzero(f, [a, b]);
fprintf('Root using fzero: %f\n', root_fzero);
fprintf('Difference between methods: %e\n', abs(result - root_fzero));
