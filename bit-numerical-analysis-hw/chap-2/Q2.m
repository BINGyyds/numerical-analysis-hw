% Define input parameters
a = -2;
a = repmat(a, 1, 7);
b = [2, 5, 5, 5, 5, 5, 5, 5];
c = a;
V = 220;
R = 27;
d = [V/R, 0, 0, 0, 0, 0, 0, 0];

% Call the function
x = thomas_algorithm(a, b, c, d);

% Display the output
disp(x);