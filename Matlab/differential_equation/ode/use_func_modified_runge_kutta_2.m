clc;
clear;
close all;

f = @(x, y)(2 + sqrt(y*x));
x0 = 0.2;
y0 = 1;
h = 0.4;
xN = 1;

N = round((xN-x0)/h)+1;
x = x0:h:xN;
y = x;
y(1) = y0;

fprintf("n\tx\t\t\t\tK1\t\t\t\tK2\t\t\t\ty\n");
fprintf("0)\t%.10f\t%.10f\t%.10f\t%.10f\n", x(1), 0, 0, y(1));

for n = 1:N-1
    K1 = h*f(x(n), y(n));
    K2 = h*f(x(n) + h*2/3, y(n) + K1*2/3);
    y(n+1) = y(n) + (K1 + 3*K2)/4;
    fprintf("%d)\t%.10f\t%.10f\t%.10f\t%.10f\n", n, x(n+1), K1, K2, y(n+1));
end

% **************************************************^**************************************************
% *****************************# Copyright by Ali Forouzandeh Hafshejani #*****************************
% ******************************# Scientific Computing Specialist 20@20 #******************************
% **************************************************^**************************************************