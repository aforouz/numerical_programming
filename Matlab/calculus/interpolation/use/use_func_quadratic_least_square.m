clc;
clear;
close all;

% Input
x = [0, 0.25, 0.5, 0.75, 1];
F = @(x)(x.*sin(x));

% Algorithm
y = F(x');
n = length(y);

A = [n, sum(x), sum(x.^2);
    sum(x), sum(x.^2), sum(x.^3);
    sum(x.^2), sum(x.^3), sum(x.^4)];
B = [sum(y); x*y; x.^2*y];

cba = A\B;

% Output
fprintf('|%.10f\t%.10f\t%.10f\t||c| |%.10f\t|\n', A(1, 1), A(1, 2), A(1, 3), B(1));
fprintf('|%.10f\t%.10f\t%.10f\t||b|=|%.10f\t|\n', A(2, 1), A(2, 2), A(2, 3), B(2));
fprintf('|%.10f\t%.10f\t%.10f\t||a| |%.10f\t|\n', A(3, 1), A(3, 2), A(3, 3), B(3));
fprintf('\n|c| |%.10f\t|\n|b|=|%.10f\t|\n|a| |%.10f\t|\n', cba(1), cba(2), cba(3));
fprintf('\ny = a*x^2 + b*x + c = %.10f*x^2 + %.10f*x + %.10f\n', cba(3), cba(2), cba(1));

% Plot
yy = [ones(n, 1), x', x.^2']*cba;
plot(x, y, '*', x, yy, '-');
grid on;

% **************************************************^**************************************************
% *****************************# Copyright by Ali Forouzandeh Hafshejani #*****************************
% ******************************# Scientific Computing Specialist 20@21 #******************************
% **************************************************^**************************************************