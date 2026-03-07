f = @(x) x .^ 2 + sin(10 * x) - 1;
x = linspace(-2, 2, 10000);
y = f(x);

% Plot the function
figure;
plot(x, y);
xlabel('x');
ylabel('f(x)');
title('Plot of f(x) = x^2 + sin(10x) - 1');
grid on;
ylim([-1 1]);

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
        [root, n, error] = iterative_root_finding([], [a, b], 1e-6, 'newton', f);
        plot(root, f(root), 'ro');
        fprintf('Approximated root No.%d: %f\n', r_num, root);
        r_num = r_num + 1;
    elseif f(a) == 0
        plot(a, f(a), 'bo');
    end

end

hold off;
