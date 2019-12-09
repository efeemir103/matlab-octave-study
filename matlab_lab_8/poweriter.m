function [eigMax eigvMax] = poweriter(A, delta)
  [m n] = size(A);
  if(m ~= n)
    error('The matrix must be square')
  end
  eigvMax{1} = rand(m, 1);
  eigvMax{1} = eigvMax{1}/norm(eigvMax{1});
  eigMax{1} = (eigvMax{1}'*A*eigvMax{1})/(eigvMax{1}'*eigvMax{1});
  k = 1;
  while(1)
  eigvMax{k+1} = (A*eigvMax{k})/norm(A*eigvMax{k});
  eigMax{k+1} = (eigvMax{k+1}'*A*eigvMax{k+1})/(eigvMax{k+1}'*eigvMax{k+1});
  if norm(eigvMax{k+1}-eigvMax{k}) < delta
    break;
  end
  k = k + 1;
end
