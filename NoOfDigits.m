clc;
clear all;
samples = 21604221;
y = samples;
j = 0;
while y>0
    j = j+1;
    y = floor(y/10);
end
m = 10^(floor(j/2));
n = floor(samples/m);
remaining = samples-(m*n);
