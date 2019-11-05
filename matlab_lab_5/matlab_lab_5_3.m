st = 200;
x = -1:4/(st-1):3;
f = [1 -5 5 2];
[xmin, xmax, fmin, fmax, fcalc] = minmax(x, f);
plot(x, fcalc);