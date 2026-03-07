f = @(x) exp(-2 * x + 6) .* cos(10 * x) + exp(-3 * x) .* sin(2 * x) - exp(6);
x = linspace(-1, 1, 10000);
y = f(x);

% Plot the function
figure;
plot(x, y);
xlabel('x');
ylabel('f(x)');
title('Plot of f(x) = exp(-2x + 6)cos(10x) + exp(-3x)sin(2x) - exp(6)');
grid on;

hold on;

r_num = 1;

for i = 1:length(x) - 1
    a = x(i);
    b = x(i + 1);

    if f(a) * f(b) > 0
        continue;
    elseif f(a) * f(b) < 0
        c = (a + b) / 2;
        % Newton's method with secant (no df provided):
        [root, ~, ~] = iterative_root_finding([], [a, b], 1e-6, 'newton', f);
        plot(root, f(root), 'ro');
        fprintf('Approximated root No.%d: %f\n', r_num, root);
        r_num = r_num + 1;
    elseif f(a) == 0
        plot(a, f(a), 'bo');
    end

end

hold off;
