function fact = factorization(x)
  if x < 0
    fact = fprintf('Error: %2g is not a non-negative number\n', x);
  elseif x == 0
    fact = 1;
  elseif x >= 0
    fact = fprintf('Error: %2g is not a single number\n',x);
  end
end
