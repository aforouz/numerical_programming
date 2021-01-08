clc;
clear;
close all;

x = [0 1 2 3 4];
f = [0 0 1 0 0];

if size(x, 2)==1
    x = x';
end
if size(f, 1)==1
    f = f';
end

n = length(f);
A = ones(n)*NaN;
A(:, 1) = f;
for j = 2:n
    for i = j:n
        A(i, j) = (A(i, j-1)-A(i-1, j-1))/(x(i)-x(i-j+1));
    end
end

fprintf("x\t\t\t\t|f1\t\t\t\t");
for i = 2:n
    fprintf("f%d\t\t\t\t", i);
end
fprintf("\n");
for i = 1:n
    fprintf("%.10f\t|", x(i));
    fprintf("%.10f\t", A(i, :));
    fprintf("\n");
end

% **************************************************^**************************************************
% *****************************# Copyright by Ali Forouzandeh Hafshejani #*****************************
% ******************************# Scientific Computing Specialist 20@20 #******************************
% **************************************************^**************************************************