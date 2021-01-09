clc;
clear;
close all;

%{
F = @(x)(x.*sin(x))
%}

% Input
F = input('Enter f: ');

% Algorithm
NintF = (5*F(-sqrt(3/5)) + 8*F(0) + 5*F(sqrt(3/5)))/9;

% Output
fprintf('\nNintF = %.10f\n', NintF);

% Compare
EintF = integral(F, -1, 1);
fprintf('EintF = %.10f\nError = %.10f\n', EintF, abs(EintF - NintF));

% **************************************************^**************************************************
% *****************************# Copyright by Ali Forouzandeh Hafshejani #*****************************
% ******************************# Scientific Computing Specialist 20@21 #******************************
% **************************************************^**************************************************