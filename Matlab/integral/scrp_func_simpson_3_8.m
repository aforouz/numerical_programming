clc;
clear;
close all;

%{
a = 0
b = .6
N = 6
f = @(x)(x.*sin(x))
%}

% Input
a = input('Enter a: ');
b = input('Enter b: ');
N = input('Enter N: ');
f = input('Ent func: ');

% Algorithm
x = linspace(a, b, N+1);
y = f(x);
h = (x(2) - x(1));

NIntFO = 0;
for i = 2:3:N
    NIntFO = NIntFO + y(i) + y(i+1);
end

NIntFE = 0;
for i = 4:3:N
    NIntFE = NIntFE + y(i);
end

NIntF = 3*NIntFO + 2*NIntFE + y(1) + y(end);
NIntF = NIntF*h*3/8;

% Output
fprintf("NIntF = %.10f\n", NIntF);

% Compare
IntF = integral(f, a, b);
fprintf("IntF = %.10f\nError = %.10f\n", IntF, abs(NIntF - IntF));

% **************************************************^**************************************************
% *****************************# Copyright by Ali Forouzandeh Hafshejani #*****************************
% ******************************# Scientific Computing Specialist 20@21 #******************************
% **************************************************^**************************************************