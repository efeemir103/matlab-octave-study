%% using loops
y = zeros(size(-9:0.5:9));
ii = 1;
for t=-9:0.5:9
  if t<0
    y(ii) = 3*t^2+5;  
  else
    y(ii) = -3*t^2+5;
  end
  ii++;
end
