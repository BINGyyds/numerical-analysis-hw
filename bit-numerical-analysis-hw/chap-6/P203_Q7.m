x = [1; 2; 3; 4; 6; 8; 10; 12; 14; 16];
y = [4.00; 6.41; 8.01; 8.79; 9.53; 9.86; 10.33; 10.42; 10.53; 10.61];
m = 1;

[A, b] = leastSquaresMatrix(1 ./ x, 1 ./ y, m);

coefficients = A \ b;

disp('y = x / ax + b');
disp('1/y = a + b/x');

disp('x:');
disp(x);

disp('y:');
disp(y);

disp('1/x');
disp(1 ./ x);

disp('1/y');
disp(1 ./ y);

disp('m:');
disp(m);

disp('A:');
disp(A);

disp('b:');
disp(b);

disp('Coefficients:');
disp(coefficients);
