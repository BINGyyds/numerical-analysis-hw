f = @(x) 5 * x .^ 23 - 6 * x .^ 7 + 8 * x .^ 6 - 5 * x .^ 2;
x = linspace(-1, 1, 10000);
y = f(x);

% Plot the function
figure;
plot(x, y);
xlabel('x');
ylabel('f(x)');
title('Plot of f(x) = 5x^{23} - 6x^{7} + 8x^{6} - 5x^{2}');
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

% Newton's method with secant (no df provided):
[root, ~, ~] = iterative_root_finding([], [-1e-1, 1/2], 1e-6, 'newton', f);
plot(root, f(root), 'ko', 'MarkerFaceColor', 'k');
fprintf('Approximated root No.%d: %f\n', r_num, root);

hold off;
