clc;
clear;
close all;

f = @(x, y)(y + x^2);
x0 = 0;
y0 = 1;
h = 0.1;
xN = 1;

N = round((xN-x0)/h)+1;
x = x0:h:xN;
y = x;
y(1) = y0;

fprintf("n\tx\t\t\t\thy\t\t\t\ty\n0)\t%.10f\t%.10f\t%.10f\n", x(1), 0, y(1));
for n = 1:N-1
    hy = y(n) + h*f(x(n), y(n))/2;
    y(n+1) = y(n) + h*f(x(n) + h/2, hy);
    fprintf("%d)\t%.10f\t%.10f\t%.10f\n", n, x(n+1), hy, y(n+1));
end

% **************************************************^**************************************************
% *****************************# Copyright by Ali Forouzandeh Hafshejani #*****************************
% ******************************# Scientific Computing Specialist 20@20 #******************************
% **************************************************^**************************************************