
clc;
clear all;
close all;

i = 1;  

while true
    if mod(i, 11) == 0 && mod(i, 2) ~= 0 
        x = i;
        if sqrt(x) > 132

        break; 
        end

    end
    i = i + 1;
end
disp("the required message: ")
disp(x);


