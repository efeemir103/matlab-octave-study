n = input("n = ");
tic
for jj = 2:n
  fprintf("%d ",jj);
  prime = 1
  for ii = 2:sqrt(jj)
   if mod(jj, ii) == 0
     prime = 0;
     break;
   else
    prime = 1;
   end
  end
  fprintf(" prime = %d\n", prime);
end

toc