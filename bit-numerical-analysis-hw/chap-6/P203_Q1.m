x = [1.36; 1.49; 1.73; 1.81; 1.95; 2.16; 2.28; 2.48];
y = [14.094; 15.069; 16.844; 17.378; 18.435; 19.949; 20.963; 22.495];
m = 1;

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
