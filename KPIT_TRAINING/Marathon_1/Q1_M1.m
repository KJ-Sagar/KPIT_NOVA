clc;
clear all;
close all;
x1 =0;
x2=1;
disp(x1+" ")
disp(x2+" ")
for i = 2:20
    sum = x1+x2;
    x1 = x2;
    x2 = sum;
    disp(sum+" ")
end

