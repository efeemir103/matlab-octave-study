x = input("Enter degrees(x) for tan(x): ");

if abs(cosd(x)) >= 1e-20
  fprintf("tan(%g) = %g \n", x, tand(x));
else
  fprintf("Error: tan(%g) is not defined.\n", x);
end
