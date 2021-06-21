clc;
clear;
close all;

% Input
a = 0;
b = 1;
N = 6;
F = @(x)(x.*sin(x));

% Algorithm
h = (b-a)/N;
x = a:h:b;
y = F(x);

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
fprintf('NintF = %.10f\n', NintF);

% Compare
EintF = integral(F, a, b);
fprintf('EintF = %.10f\nError = %.10f\n', EintF, abs(EintF - NintF));

% **************************************************^**************************************************
% *****************************# Copyright by Ali Forouzandeh Hafshejani #*****************************
% ******************************# Scientific Computing Specialist 20@21 #******************************
% **************************************************^**************************************************