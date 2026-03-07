x = [1; 3; 4; 5; 6; 7; 8; 9; 10];
y = [10; 5; 4; 2; 1; 1; 2; 3; 4];
m = 2;

[A, b] = leastSquaresMatrix(x, y, m);

coefficients = A \ b;

disp('x:');
disp(x);

disp('y:');
disp(y);

disp('m:');
disp(m);

disp('A:');
disp(A);

disp('b:');
disp(b);

disp('Coefficients:');
disp(coefficients);
