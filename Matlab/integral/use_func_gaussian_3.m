clc;
clear;
close all;

% Input
f = @(x)(x.*sin(x));

% Algorithm
NIntF = (5*f(-sqrt(3/5)) + 8*f(0) + 5*f(sqrt(3/5)))/9;

% Output
fprintf("NIntF = %.10f\n", NIntF);

% Compare
IntF = integral(f, -1, 1);
fprintf("IntF = %.10f\nError = %.10f\n", IntF, abs(NIntF - IntF));

% **************************************************^**************************************************
% *****************************# Copyright by Ali Forouzandeh Hafshejani #*****************************
% ******************************# Scientific Computing Specialist 20@21 #******************************
% **************************************************^**************************************************