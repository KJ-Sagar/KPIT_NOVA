clc; 
clear;
close all;


disp('Enter the coordinates of three points:');
x1 = input('Enter x1: '); 
x2 = input('Enter x2: '); 
y1 = input('Enter y1: ');
y2 = input('Enter y2: ');
x3 = input('Enter x3: ');
y3 = input('Enter y3: ');

A1 = x2 - x1;
B1 = y2 - y1;
C1 = (x1^2 - x2^2 + y1^2 - y2^2) / 2;
A2 = x3 - x2;
B2 = y3 - y2;
C2 = (x2^2 - x3^2 + y2^2 - y3^2) / 2;
D = A1 * B2 - A2 * B1; 
h = (C1 * B2 - C2 * B1) / D;  
k = (A1 * C2 - A2 * C1) / D;
radius = sqrt((h - x1)^2 + (k - y1)^2);
fprintf('Center of the circle: (%.2f, %.2f)\n', h, k);
fprintf('Radius of the circle: %.2f\n', radius);
theta = linspace(0, 2*pi, 100);
x_circle = h + radius * cos(theta);
y_circle = k + radius * sin(theta); 
figure;
plot(x_circle, y_circle, 'k', 'LineWidth', 2);
hold on;
plot([x1, x2, x3], [y1, y2, y3], 'r*', 'MarkerSize', 10); 
axis equal;

xlabel('X-axis');
ylabel('Y-axis');
title('Circle Passing Through Three Given Points');
plot(h, k, 'go', 'MarkerSize', 4, 'MarkerFaceColor', 'g');
legend('Circle', 'Given Points', 'Center');
hold off;
