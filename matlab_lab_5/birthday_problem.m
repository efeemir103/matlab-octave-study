function x = birthday_problem(n, test_num)
  %% calculate probability of minimum 2 people having same birthday in n people
  tic
  sum = 0;
  for jj = 1:test_num
    birthdays = randi([1 365], 1, n);
    for ii = 2:n
      if birthdays(ii-1) == birthdays(ii)
        sum = sum + 1;
        break;
      end
    end
  end
  x = sum / test_num;
  toc
end
