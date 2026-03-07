% Define the Cornu spiral functions
a = 1;
tolerance_x = 1e-6;
tolerance_y = 1e-10;

% Define the integrand functions for x(s) and y(s)
fx = @(s) cos(pi * s .^ 2/2);
fy = @(s) sin(pi * s .^ 2/2);

% Define the range for s
s_range = linspace(-5, 5, 1000);

% Initialize arrays to store the results
x_vals = zeros(size(s_range));
y_vals = zeros(size(s_range));

% Compute the values of x(s) and y(s) using adaptive integration
for i = 1:length(s_range)
    s = s_range(i);
    x_vals(i) = adaptive_int(fx, 0, s, 'trapezoidal', tolerance_x);
    y_vals(i) = adaptive_int(fy, 0, s, 'trapezoidal', tolerance_y);
end

% Plot the Cornu spiral
figure;
plot(x_vals, y_vals);
title('Cornu Spiral');
xlabel('x');
ylabel('y');
grid on;
