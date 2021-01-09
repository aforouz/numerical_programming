clc;
clear;
close all;

% Input
xbar = 0.34;
x = [0, 0.25, 0.5, 0.75, 1];
f = @(x)(x.*sin(x));

if size(x, 2)==1
    x = x';
end
if size(f, 1)==1
    f = f';
end

n = length(f);
L = ones(1, n);
for i = 1:n
    for j = 1:n
        if i ~= j
            L(i) = L(i)*(xbar - x(j))/(x(i) - x(j));
        end
    end
end

fprintf("x\t\t\t\t|f\t\t\t\tL\n");
for i = 1:n
    fprintf("%.10f\t|%.10f\t%.10f\n", x(i), f(i), L(i));
end

fprintf("\np(x) = %.10f\n", L*f);

% **************************************************^**************************************************
% *****************************# Copyright by Ali Forouzandeh Hafshejani #*****************************
% ******************************# Scientific Computing Specialist 20@20 #******************************
% **************************************************^**************************************************