clc; clear; close all;

fprintf('Enter the coordinates of the three points:\n');
x1 = input('x1: '); y1 = input('y1: ');
x2 = input('x2: '); y2 = input('y2: ');
x3 = input('x3: '); y3 = input('y3: ');

A = [2*(x2-x1), 2*(y2-y1); 2*(x3-x1), 2*(y3-y1)];
B = [(x2^2 + y2^2 - x1^2 - y1^2); (x3^2 + y3^2 - x1^2 - y1^2)];

center = A\B;
h = center(1);
k = center(2);

radius = sqrt((x1-h)^2 + (y1-k)^2);

fprintf('Center of the circle: (%.2f, %.2f)\n', h, k);
fprintf('Radius of the circle: %.2f\n', radius);

theta = linspace(0, 2*pi, 100);
x_circle = h + radius * cos(theta);
y_circle = k + radius * sin(theta);

figure;
plot(x_circle, y_circle, 'b', 'LineWidth', 2); hold on;
plot([x1, x2, x3], [y1, y2, y3], 'r*', 'MarkerSize', 10, 'LineWidth', 2);
axis equal;
gridx = xlim;
gridy = ylim;
grid on;
title('Circle Passing Through Three Points');
xlabel('X-axis'); ylabel('Y-axis');
legend('Circle', 'Given Points');

disp('Plot generated successfully.');
