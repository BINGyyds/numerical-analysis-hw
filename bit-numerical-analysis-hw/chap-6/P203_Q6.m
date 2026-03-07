x = [1; 2; 3; 4; 5; 6; 7; 8];
y = [15.3; 20.5; 27.4; 36.6; 49.1; 65.6; 87.87; 117.6];
m = 1;

[A, b] = leastSquaresMatrix(x, log(y), m);

coefficients = A \ b;

disp('y = a*exp(bx)');
disp('ln(y) = ln(a) + bx');

disp('x:');
disp(x);

disp('y:');
disp(y);

disp('log(y)');
disp(log(y));

disp('m:');
disp(m);

disp('A:');
disp(A);

disp('b:');
disp(b);

disp('Coefficients:');
disp(coefficients);

a = exp(coefficients(1));
b = coefficients(2);

disp('a:');
disp(a);

disp('b:');
disp(b);
