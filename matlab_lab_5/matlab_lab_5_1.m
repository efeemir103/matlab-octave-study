x = -3:0.01:3
[sfunc, cfunc, tfunc] = hyperb(x);
subplot(1,3,1)
plot(x, sfunc, 'r-.', 'LineWidth', 2);
xlabel('Argument of hyperbolic sine function');
ylabel('Hyperbolic sine function');
axis([-3 3 -10 10])
subplot(1,3,2)
plot(x, cfunc);
subplot(1,3,3)
plot(x, tfunc, 'LineWidth', 1.5 );