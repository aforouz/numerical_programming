%{
f = @(x)(x.*sin(x))
%}

function [NIntF, IntF, IntErr] = func_func_gaussian_2(f)

% Algorithm
NIntF = f(-sqrt(1/3)) + f(sqrt(1/3));

% Compare
IntF = integral(f, -1, 1);
IntErr = abs(NIntF - IntF);

% **************************************************^**************************************************
% *****************************# Copyright by Ali Forouzandeh Hafshejani #*****************************
% ******************************# Scientific Computing Specialist 20@21 #******************************
% **************************************************^**************************************************