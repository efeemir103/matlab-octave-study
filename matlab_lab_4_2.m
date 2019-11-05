figure(1);

x = -1:0.1:3;
y = x(:).^2-3*x(:)+2;

subplot(1,2,1)

plot(x, y, 'co-', 'LineWidth', 3);

subplot(1,2,2)

y = x(:) .^ 10 - 10 / x(:) .^ 4;

plot(x, y, 'mo-', 'LineWidth', 3);