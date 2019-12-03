% Drawing the point for the complex number in a cartesian coordinate
a = input('Enter the magnitude of the complex number. a = ');
b = input('Enter the phase angle as a radian of the complex number. b = ');
[x, y] = cart(a, b);
plot(x, y, 'r o', 'LineWidth', 2);
grid on;
hold on;
% Drawing the line from origin to the point
x1 = 0:0.1:x;
y1 = x1*tan(b);
plot(x1, y1);
