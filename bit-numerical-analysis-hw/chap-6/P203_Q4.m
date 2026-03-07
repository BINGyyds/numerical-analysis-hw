x = [19; 25; 31; 38; 44];
y = [19.0; 32.3; 49.0; 73.3; 97.8];
m = 1;

[A, b] = leastSquaresMatrix(x .^ 2, y, m);

coefficients = A \ b;

disp('y = a + bx^2');

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
