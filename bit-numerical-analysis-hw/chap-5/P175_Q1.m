% Define the original function
f = @(x) 1 ./ (1 + 4 * x .^ 2);
disp(['Original function f: ', func2str(f)]);

% Define the interpolation points
x = linspace(-5, 5, 11);
y = f(x);
disp(['Interpolation points x: ', num2str(x)]);
disp(['Function values at interpolation points y = f(x): ', num2str(y)]);

% Compute the divided difference table
dd = divided_difference(x, y);

% Compute the Newton interpolation polynomial
P = newtonInterp(x, y, dd);
disp(['Newton interpolation polynomial P_n: ', char(vpa(P, 4))]);

x_range = linspace(-5, 5, 99 + 2);
y_range = f(x_range);
y_interp = double(subs(P, x_range));

figure;

% Plot the original function and the Newton interpolation polynomial
subplot(1, 2, 1);
plot(x_range, y_range, 'b-', 'LineWidth', 1);
hold on;

% Plot the Newton interpolation polynomial
plot(x_range, y_interp, 'r--', 'LineWidth', 1);

% Plot the interpolation points
plot(x, y, 'ko', 'MarkerFaceColor', 'k');

% Add labels and legend
xlabel('x');
ylabel('y');
title('Original Function and Newton Interpolation Polynomial');
legend('Original Function', 'Newton Interpolation Polynomial', 'Interpolation Points');
grid on;
hold off;

% draw the error plot
subplot(1, 2, 2);
y_error = y_interp - y_range;
plot(x_range, y_error, 'b-', 'LineWidth', 1);

% Add labels and legend
xlabel('x');
ylabel('Error');
title('Error Plot');
grid on;
