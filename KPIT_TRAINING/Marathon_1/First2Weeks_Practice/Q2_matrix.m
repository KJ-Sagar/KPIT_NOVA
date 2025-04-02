clc;
clear all;
close all;

n =input('enter the vlaue of n :');
m = input('enter the value of m :');
mx = zeros(n,m)
rs =0;
cs=0;
for i =1:n
    mx(1,i)=i;
end
for j=1:m
    mx(j,1) = j;
end
for i=2:n
    for j=2:m
        
            rs = sum(mx(1:i-1,j));
            cs=sum(mx(i,1:j-1));
       

      mx(i,j) = rs + cs;
    end
end


display(mx);