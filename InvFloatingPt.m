clc;
clear all;
x = 0.54567;
%y = a*exp(x);
y = x;
i = 0;
c = 0
while y>=x
    y = 2*exp(-i);
    i=i+0.125;
    c = c+1;
end
a = x/y;