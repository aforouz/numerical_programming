%{
a = 0;
b = pi/2;
F = @(x)(sin(x));
%}

function [NintF, EintF, NintE] = func_func_gaussian_2(a, b, F)

% Algorithm
G = @(x)((b-a)/2*F(((b-a).*x + (b+a))./2));
NintF = G(-sqrt(1/3)) + G(sqrt(1/3));

% Compare
EintF = integral(F, a, b);
NintE = abs(EintF - NintF);

% **************************************************^**************************************************
% *****************************# Copyright by Ali Forouzandeh Hafshejani #*****************************
% ******************************# Scientific Computing Specialist 20@21 #******************************
% **************************************************^**************************************************