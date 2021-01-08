%{
F = @(x)(x.*sin(x))
%}

function [NintF, EintF, NintE] = func_func_gaussian_3(F)

% Algorithm
NintF = (5*F(-sqrt(3/5)) + 8*F(0) + 5*F(sqrt(3/5)))/9;

% Compare
EintF = integral(F, -1, 1);
NintE = abs(EintF - NintF);

% **************************************************^**************************************************
% *****************************# Copyright by Ali Forouzandeh Hafshejani #*****************************
% ******************************# Scientific Computing Specialist 20@21 #******************************
% **************************************************^**************************************************