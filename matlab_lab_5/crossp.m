function Cprod = crossp(A, B)
  %% crossp(A, B) calculates cross product of A and B
  Cprod(1) = A(2) * B(3) - A(3) * B(2);
  Cprod(2) = A(3) * B(1) - A(1) * B(3);
  Cprod(3) = A(1) * B(2) - A(2) * B(1);
  %% Cprod = cross(A, B);
end
