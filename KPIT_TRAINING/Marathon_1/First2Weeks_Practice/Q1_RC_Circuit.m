clc;
clear all;
close all;

Io = input("enter the value of current(i)");
Vo = input("enter the value of voltage (v)");
R = input("enter the value of resister");
C = input("enter the value of capacitor");
t = [0:1:10]
for i =1:length(t)
  It(i) = Io*exp(-t(i)/(R*C));
  Vt(i) =Vo*(1-exp(-t(i)/(R*C)));
end
plot(t,It,"k--")
hold on
plot(t,Vt,"r--");
hold off
xlabel('Time (S)');
ylabel('Current (i) and Voltage (V)')
title('RC Circut')
legend('It','Vt')
