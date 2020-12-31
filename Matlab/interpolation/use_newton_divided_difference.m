clc;
clear;
close all;

x = 0.34;
xi = [0, 0.25, 0.5, 0.75, 1];
f = [0, 0.47314, 0.90546, 1.30962, 1.69375];

if size(xi, 2)==1
    xi = xi';
end
if size(f, 1)==1
    f = f';
end

n = length(f);
A = ones(n)*NaN;
A(:, 1) = f;
for j = 2:n
    for i = j:n
        A(i, j) = (A(i, j-1)-A(i-1, j-1))/(xi(i)-xi(i-j+1));
    end
end

fprintf("x\t\t\t\t|f1\t\t\t\t");
for i = 2:n
    fprintf("f%d\t\t\t\t", i);
end
fprintf("\n");
for i = 1:n
    fprintf("%.10f\t|", xi(i));
    for j = 1:i
        fprintf("%.10f\t", A(i, j));
    end
    fprintf("\n");
end

X = ones(1, n);
for i = 1:n-1
    X(i+1) = (x - xi(i))*X(i);
end
fprintf("\np(x) = %.10f\n", X*diag(A));

% **************************************************^**************************************************
% *****************************# Copyright by Ali Forouzandeh Hafshejani #*****************************
% ******************************# Scientific Computing Specialist 20@20 #******************************
% **************************************************^**************************************************