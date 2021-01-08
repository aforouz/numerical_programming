clc;
clear;
close all;

% Input
a = 0;
b = .6;
N = 6;
F = @(x)(x.*sin(x));

% Algorithm
x = linspace(a, b, N+1);
y = F(x);
h = (x(2) - x(1));

NintFo = 0;
for i = 2:3:N
    NintFo = NintFo + y(i) + y(i+1);
end

NintFe = 0;
for i = 4:3:N
    NintFe = NintFe + y(i);
end

NintF = 3*NintFo + 2*NintFe + y(1) + y(end);
NintF = NintF*h*3/8;

% Output
fprintf("NintF = %.10f\n", NintF);

% Compare
EintF = integral(F, a, b);
fprintf("EintF = %.10f\nError = %.10f\n", EintF, abs(EintF - NintF));

% **************************************************^**************************************************
% *****************************# Copyright by Ali Forouzandeh Hafshejani #*****************************
% ******************************# Scientific Computing Specialist 20@21 #******************************
% **************************************************^**************************************************