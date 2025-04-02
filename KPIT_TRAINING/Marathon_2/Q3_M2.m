
clc;
clear all;
close all;

Grades = [87,91,81,85,72,75,70,84,63,39,64,97,74,81,73;
         85,76,77,94,67,79,93,0,0,52,59,64,79,0,82;
         74,86,85,85,86,73,70,72,92,93,57,48,48,73,76;
         87,88,77,96,86,83,82,84,98,72,64,61,61,38,80;
         72,71,84,60,83,0,74,0,79,79,56,84,43,95,68;
         86,82,79,76,84,75,85,62,90,55,90,86,63,89,69;
         83,96,80,82,71,86,80,96,0,67,55,72,84,61,71];


Final_Grades(Grades);

function Final_Grades(data)

   r = input("enter the rubric vector : ");
    students = size(data, 1);
    finalM = zeros(students, 3);
    results = zeros(students, 1);
    
    for i = 1:students
        finalM(i,1) = mean(data(i,1:7));   
        finalM(i,2) = mean(data(i,8:10));  
        finalM(i,3) = mean(data(i,11:15)); 
        results(i) = sum(finalM(i,:) .* r);
        fprintf('Student %d Final_Score: %.2f\n', i, results(i));
    end
end

