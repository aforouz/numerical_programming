clc;
clear;
close all;

% Input
F = @(x)(x.*sin(x));

% Algorithm
NintF = F(-sqrt(1/3)) + F(sqrt(1/3));

% Output
fprintf('NintF = %.10f\n', NintF);

% Compare
EintF = integral(F, -1, 1);
fprintf('EintF = %.10f\nError = %.10f\n', EintF, abs(EintF - NintF));

% **************************************************^**************************************************
% *****************************# Copyright by Ali Forouzandeh Hafshejani #*****************************
% ******************************# Scientific Computing Specialist 20@21 #******************************
% **************************************************^**************************************************