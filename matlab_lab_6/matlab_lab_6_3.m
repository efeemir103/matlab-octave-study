% Case Insensitive Searching
chr = input('Enter the specified character chr = ', 's');
str = input('Enter the string in order to check the specified character chr str = ', 's');
index = strfind(lower(str), lower(chr));
count = length(index);
fprintf('%4g\n', count);
