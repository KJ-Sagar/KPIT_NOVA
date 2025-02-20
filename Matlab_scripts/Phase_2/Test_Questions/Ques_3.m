clc;
clear;
r = [0.2, 0.45, 0.35];
marks = [87,91,81,85,72,75,70,84,63,39,64,97,74,81,73;
         85,76,77,94,67,79,93,0,0,52,59,64,79,0,82;
         74,86,85,85,86,73,70,72,92,93,57,48,48,73,76;
         87,88,77,96,86,83,82,84,98,72,64,61,61,38,80;
         72,71,84,60,83,0,74,0,79,79,56,84,43,95,68;
         86,82,79,76,84,75,85,62,90,55,90,86,63,89,69;
         83,96,80,82,71,86,80,96,0,67,55,72,84,61,71];
Final_Score(marks, r);
function Final_Score(marks, r)
    num_students = size(marks, 1); 
    student_marks = zeros(num_students, 3); 
    Finalgrade = zeros(num_students, 1); 

    for i = 1:num_students
        student_marks(i,1) = mean(marks(i,1:7));   
        student_marks(i,2) = mean(marks(i,8:10));  
        student_marks(i,3) = mean(marks(i,11:15)); 
        Finalgrade(i) = student_marks(i,1) * r(1) + student_marks(i,2) * r(2) + student_marks(i,3) * r(3);
        disp(['The final score of Student ', num2str(i), ' is: ', num2str(Finalgrade(i))]);
    end
end
