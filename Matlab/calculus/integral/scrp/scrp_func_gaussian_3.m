clc;
clear;
close all;

%{
a = 1;
b = 1.2;
F = @(x)(exp(-x.^2));
%}

% Input
a = input('Enter a: ');
b = input('Enter b: ');
F = input('Enter f: ');

% Algorithm
G = @(x)((b-a)/2*F(((b-a).*x + (b+a))./2));
NintF = (5*G(-sqrt(3/5)) + 8*G(0) + 5*G(sqrt(3/5)))/9;

% Output
fprintf('\nNintF = %.10f\n', NintF);

% Compare
EintF = integral(F, a, b);
fprintf('EintF = %.10f\nError = %.10f\n', EintF, abs(EintF - NintF));

% **************************************************^**************************************************
% *****************************# Copyright by Ali Forouzandeh Hafshejani #*****************************
% ******************************# Scientific Computing Specialist 20@21 #******************************
% **************************************************^**************************************************