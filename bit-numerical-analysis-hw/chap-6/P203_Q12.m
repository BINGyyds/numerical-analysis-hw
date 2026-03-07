% Define basis functions
H = {@(x) 1, @(x) x .^ 2, @(x) x .^ 4};

% Define target function
g = @(x) cos(x);

% Define integration interval
int_a = -pi / 2;
int_b = pi / 2;

[A, b] = leastSquaresMatrix_Func(H, g, int_a, int_b);

coefficients = A \ b;

disp('A:');
disp(A);

disp('b:');
disp(b);

disp('Coefficients:');
disp(coefficients);
