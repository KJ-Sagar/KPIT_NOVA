clc;
clear;
n1 = 5;
n2=7;
t=0:1:100;

x1=cos(((n1-1)*t*pi)/n1);
y1=sin(((n1-1)*t*pi)/n1);

x2=cos(((n2-1)*t*pi)/n2);
y2=sin(((n2-1)*t*pi)/n2);

subplot(2,1,1)
plot(x1,y1)
title("N-Pointed star")

subplot(2,1,2)
plot(x2,y2)
title("N-pointed star")