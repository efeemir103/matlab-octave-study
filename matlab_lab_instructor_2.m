clc; clear all;

r=input('Enter the radious of the cylinder = ');
h=input('Enter the height of the cylinder = ');
vol=pi*r^2*h;
disp(['The volume of the cylinder is ',num2str(vol)]);
fprintf('The volume of the cylinder is %f \n', vol);