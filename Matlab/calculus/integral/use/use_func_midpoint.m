clc;
clear;
close all;

% Input
a = 0;
b = 1;
N = 6;
F = @(x)(sin(x)./x);

% Algorithm
h = (b-a)/N;
x = (a + h/2):h:b;
y = F(x);

NintF = 0;
for i = 1:N
    NintF = NintF + y(i);
end

NintF = NintF*h;

% Output
fprintf('NintF = %.10f\n', NintF);

% Compare
EintF = integral(F, a, b);
fprintf('EintF = %.10f\nError = %.10f\n', EintF, abs(EintF - NintF));

% **************************************************^**************************************************
% *****************************# Copyright by Ali Forouzandeh Hafshejani #*****************************
% ******************************# Scientific Computing Specialist 20@21 #******************************
% **************************************************^**************************************************