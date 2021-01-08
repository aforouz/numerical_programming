clc;
clear;
close all;

% Input
a = 0;
b = 0.6;
N = 6;
F = @(x)(x.*sin(x));

% Algorithm
y = F(linspace(a, b, N+1));
h = (b-a)/N;

NintF = (y(1) + y(end))/2;
for i = 2:N
    NintF = NintF + y(i);
end
NintF = NintF*h;

% Output
fprintf("NintF = %.10f\n", NintF);

% Compare
EintF = integral(F, a, b);
fprintf("EintF = %.10f\nError = %.10f\n", EintF, abs(EintF - NintF));

% **************************************************^**************************************************
% *****************************# Copyright by Ali Forouzandeh Hafshejani #*****************************
% ******************************# Scientific Computing Specialist 20@21 #******************************
% **************************************************^**************************************************