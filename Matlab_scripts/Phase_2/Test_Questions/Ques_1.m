clc;
clear;
t = 1;
x = 1;

while t == 1
    if mod(x, 11) ~= 0
        x = x + 1;
        continue;
    end
    if mod(x, 2) ~= 1
        x = x + 1;
        continue;
    end
    if sqrt(x) <= 132
        x = x + 1;
        continue;
    end
    disp(["The required number is:",x])
    break;
end
