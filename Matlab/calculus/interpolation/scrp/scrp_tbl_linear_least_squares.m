clc;
clear;
close all;

%{
x = [0, 0.25, 0.5, 0.75, 1];
y = [0, 0.47314, 0.90546, 1.30962, 1.69375];
%}

% Input
x = input('Enter x: ');
y = input('Enter y: ');

% Algorithm
y = y';
n = length(y);

A = [n, sum(x); sum(x), sum(x.^2)];
B = [sum(y); x*y];

ba = A\B;

% Output
fprintf('\n|%.10f\t%.10f\t||b| |%.10f\t|\n', A(1,1), A(1, 2), B(1));
fprintf('|%.10f\t%.10f\t||a|=|%.10f\t|\n', A(2,1), A(2, 2), B(2));
fprintf('\n|b| |%.10f\t|\n|a|=|%.10f\t|\n', ba(1), ba(2));
fprintf('\ny = a*x + b = %.10f*x + %.10f\n', ba(2), ba(1));

% Plot
yy = [ones(n, 1), x']*ba;
plot(x, y, '*', x, yy, '-');
grid on;

% **************************************************^**************************************************
% *****************************# Copyright by Ali Forouzandeh Hafshejani #*****************************
% ******************************# Scientific Computing Specialist 20@21 #******************************
% **************************************************^**************************************************