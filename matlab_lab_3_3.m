temp = input('Enter temperature (degrees Fahreneit): ');

if temp < 97.5
  disp('Temperature below normal');
elseif temp < 99.5
  disp('Temperature normal');
elseif temp < 103.0
  disp('Temperature slightly high');
else
  disp('Temperature dangerously high');
end
