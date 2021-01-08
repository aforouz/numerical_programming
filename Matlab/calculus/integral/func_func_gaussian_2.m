%{
F = @(x)(x.*sin(x))
%}

function [NintF, EintF, NintE] = func_func_gaussian_2(F)

% Algorithm
NintF = F(-sqrt(1/3)) + F(sqrt(1/3));

% Compare
EintF = integral(F, -1, 1);
NintE = abs(EintF - NintF);

% **************************************************^**************************************************
% *****************************# Copyright by Ali Forouzandeh Hafshejani #*****************************
% ******************************# Scientific Computing Specialist 20@21 #******************************
% **************************************************^**************************************************