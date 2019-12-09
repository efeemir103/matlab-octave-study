function [capped] = caps(str)
  capped = '';
  str = lower(str);
  str = deblank(str);
  [temp, next] = strtok(str);
  str = next;
  while(~isempty(temp))
    temp = [upper(temp(1)), temp(2:end)];
    capped = [capped, temp];
    [temp, next] = strtok(str);
    str = next;
  end
  capped = deblank(capped);
end
