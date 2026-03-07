n = 10 ^ 5;
disp(['n: ', num2str(n)]);

% Initialize matrix A with zeros
if n <= 10
    A = zeros(n, n);
else
    A = sparse(n, n);
end

% Fill the diagonal with 3
for i = 1:n
    A(i, i) = 3;
end

% Fill the sub-diagonal and super-diagonal with -1
for i = 1:n - 1
    A(i, i + 1) = -1;
    A(i + 1, i) = -1;
end

% Fill the anti-diagonal with 1/2, except for the middle elements
for i = 1:n
    j = n + 1 - i;

    if i ~= n / 2 && i ~= n / 2 + 1
        A(i, j) = 0.5;
    end

end

if n <= 10
    disp('A');
    disp(A);
end

% Initialize vector b
b = ones(n, 1) * 1.5;
b(1) = 2.5;
b(n) = 2.5;
b(floor(n / 2)) = 1.0;
b(floor(n / 2) + 1) = 1.0;

if n <= 10
    disp('b');
    disp(b);
end

max_iter = inf;
x0 = zeros(size(b));
epsilon = 1e-16;

% Call the CG function
[x, iter, last_error] = cg(A, b, max_iter, x0, epsilon);
disp('--- CG Method Outp. Start ---');
if n <= 10
    disp('Solution vector x:');
    disp(x);
else
    disp('Solution vector x: (only the first 10 elements)');
    disp(x(1:10));
end
disp('Number of iterations:');
disp(iter);
disp('Error of the last iteration:');
disp(last_error);
disp('--- CG Method Outp. End ---');