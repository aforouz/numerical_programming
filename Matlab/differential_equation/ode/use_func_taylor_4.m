clc;
clear;
close all;

f = @(x, y)(x^2 + y);
df = @(x, y)(2*x + f(x, y));
ddf = @(x, y)(2 + df(x, y));
dddf = @(x, y)(ddf(x, y));
x0 = 0;
y0 = 1;
h = 0.1;
xN = 0.3;

N = round((xN-x0)/h)+1;
x = x0:h:xN;
y = x;
y(1) = y0;

fprintf("n\tx\t\t\t\tdy\t\t\t\tddy\t\t\t\tdddy\t\t\tddddy\t\t\ty\n");
fprintf("0)\t%.10f\t%.10f\t%.10f\t%.10f\t%.10f\t%.10f\n", x(1), 0, 0, 0, 0, y(1));

xh = [h, h^2/2, h^3/6, h^4/24];
for n = 1:N-1
    F = [f(x(n), y(n)); df(x(n), y(n)); ddf(x(n), y(n)); dddf(x(n), y(n))]; 
    y(n+1) = y(n) + xh*F;
    fprintf("%d)\t%.10f\t%.10f\t%.10f\t%.10f\t%.10f\t%.10f\n", n, x(n+1), F(1), F(2), F(3), F(4), y(n+1));
end

% **************************************************^**************************************************
% *****************************# Copyright by Ali Forouzandeh Hafshejani #*****************************
% ******************************# Scientific Computing Specialist 20@20 #******************************
% **************************************************^**************************************************