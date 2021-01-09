clc;
clear;
close all;

%{
F = @(x)(x.*sin(x))
%}

% Input
F = input('Enter f: ');

% Algorithm
NintF = F(-sqrt(1/3)) + F(sqrt(1/3));

% Output
fprintf("\nNintF = %.10f\n", NintF);

% Compare
EintF = integral(F, -1, 1);
fprintf("EintF = %.10f\nError = %.10f\n", EintF, abs(EintF - NintF));

% **************************************************^**************************************************
% *****************************# Copyright by Ali Forouzandeh Hafshejani #*****************************
% ******************************# Scientific Computing Specialist 20@21 #******************************
% **************************************************^**************************************************