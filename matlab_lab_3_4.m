w = input('Enter the weight of package as pounds, w = ');
c = 15;
if w <= 70 && w > 2 
  c += (w-2)*5;
elseif w < 100
  c += (w-2)*5 + 15;
else
  disp('Package excess the maximum weight limit.');
end
