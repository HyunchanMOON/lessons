clear; clc;

n = 5;

t = 0:n;
x = cos(((n-1)*t*pi)/n);
y = sin(((n-1)*t*pi)/n);

plot(x,y)