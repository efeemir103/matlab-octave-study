function [capped] = caps(str)
  capped = '';
  str = lower(str);
  str = deblank(str);
  [temp, next] = strtok(str);
  str = next;
  temp = temp;
  while(~isempty(temp))  
    temp = strcat(upper(temp(1)), temp(2:end));
    temp = strcat(temp, ' ');
    capped = strcat(capped, temp);
    [temp, next] = strtok(str);
    str = next;
    temp = temp;
  end
  capped = deblank(capped);
end
