clc;
clear;
close all;

%{
a = 0;
b = pi/2;
F = @(x)(sin(x));
%}

% Input
a = input('Enter a: ');
b = input('Enter b: ');
F = input('Enter f: ');

% Algorithm
G = @(x)((b-a)/2*F(((b-a).*x + (b+a))./2));
NintF = G(-sqrt(1/3)) + G(sqrt(1/3));

% Output
fprintf('\nNintF = %.10f\n', NintF);

% Compare
EintF = integral(F, a, b);
fprintf('EintF = %.10f\nError = %.10f\n', EintF, abs(EintF - NintF));

% **************************************************^**************************************************
% *****************************# Copyright by Ali Forouzandeh Hafshejani #*****************************
% ******************************# Scientific Computing Specialist 20@21 #******************************
% **************************************************^**************************************************