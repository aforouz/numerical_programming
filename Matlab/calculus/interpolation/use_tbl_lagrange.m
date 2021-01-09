clc;
clear;
close all;

% Input
xbar = 0.34;
x = [0, 0.25, 0.5, 0.75, 1];
y = [0, 0.47314, 0.90546, 1.30962, 1.69375];

% Algorithm
x = x';
y = y';
n = length(y);
L = ones(1, n);
for i = 1:n
    for j = 1:n
        if i ~= j
            L(i) = L(i)*(xbar - x(j))/(x(i) - x(j));
        end
    end
end

% Output
fprintf("x\t\t\t\t|f\t\t\t\tL\n");
for i = 1:n
    fprintf("%.10f\t|%.10f\t%.10f\n", x(i), y(i), L(i));
end
fprintf("\np(x) = %.10f\n", L*y);

% **************************************************^**************************************************
% *****************************# Copyright by Ali Forouzandeh Hafshejani #*****************************
% ******************************# Scientific Computing Specialist 20@20 #******************************
% **************************************************^**************************************************