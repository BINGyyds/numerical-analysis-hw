f = @(x, y) exp(x .^ 2);
y0 = 0;
a = 0;
b = 1;
h = 0.1;

% Solve using Euler method
[x_euler, y_euler] = solve_ode(f, y0, a, b, h, 'euler');

% Solve using improved Euler method
[x_improved_euler, y_improved_euler] = solve_ode(f, y0, a, b, h, 'improved_euler');

% Display results
disp('Euler Method:');
disp([x_euler' y_euler']);

disp('Improved Euler Method:');
disp([x_improved_euler' y_improved_euler']);

% Solve using ode45
[x_ode45, y_ode45] = ode45(f, [a b], y0);

% Plot Results (Optional):
hold on;
plot(x_euler, y_euler, '-o', x_improved_euler, y_improved_euler, '-x');
plot(x_ode45, y_ode45, 'g--');
hold off;
legend('Euler', 'Improved Euler', 'ode45');
xlabel('x');
ylabel('y');
title('Numerical Solution of ODE');
