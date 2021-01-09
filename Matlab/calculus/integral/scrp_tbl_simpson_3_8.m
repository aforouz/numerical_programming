clc;
clear;
close all;

%{
x = [0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6]
y = [0, 0.0100, 0.0397, 0.0887, 0.1558, 0.2397, 0.3388]
%}

% Input
x = input('Enter x: ');
y = input('Enter y: ');

% Algorithm
N = length(y)-1;
h = (x(2) - x(1));

NintFo = 0;
for i = 2:3:N
    NintFo = NintFo + y(i) + y(i+1);
end

NintFe = 0;
for i = 4:3:N
    NintFe = NintFe + y(i);
end

NintF = 3*NintFo + 2*NintFe + y(1) + y(end);
NintF = NintF*h*3/8;

% Output
fprintf("\nNintF = %.10f\n", NintF);

% **************************************************^**************************************************
% *****************************# Copyright by Ali Forouzandeh Hafshejani #*****************************
% ******************************# Scientific Computing Specialist 20@21 #******************************
% **************************************************^**************************************************