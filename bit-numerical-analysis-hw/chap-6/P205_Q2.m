x = [2; 3; 5; 6; 7; 9; 10; 11; 12; 14; 16; 17; 19; 20];
y = [106.42; 108.26; 109.58; 109.50; 109.86; 110.00; 109.93; 110.59; 110.60; 110.72; 110.90; 110.76; 111.10; 111.30];
m = 1;

[A, b] = leastSquaresMatrix(1 ./ x, 1 ./ y, m);

coefficients = A \ b;

disp('y = x / ax + b');
disp('1/y = a + b/x');

disp('Coefficients:');
disp(coefficients);

a = coefficients(1);
b = coefficients(2);

% Plot the original data points
figure;
scatter(x, y, 'filled');
hold on;

% Plot the fitted line
x_fit = linspace(min(x), max(x), 100);
y_fit = x_fit ./ (a * x_fit + b);
plot(x_fit, y_fit, 'r');

xlabel('x');
ylabel('y');
title('Data points and fitted line');
legend('Data points', 'Fitted line');
hold off;
