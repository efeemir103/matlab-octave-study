value = pi*10;
disp(['value = ' num2str(value)]); % value = 31.4159
disp(['value = ' int2str(value)]); % value = 31
fprintf('value = %e\n', value); % value = 3.141593e+01
fprintf('value = %f\n', value); % value = 31.415927
fprintf('value = %g\n', value); % value = 31.4159
fprintf('value = %12.4f\n', value); % value =      31.4159
fprintf('value = %9.4f\n', value); % value =   31.4159
fprintf('value = %5.4f\n', value); % value = 31.4159
fprintf('value = %12.1f\n', value); % value =         31.4
