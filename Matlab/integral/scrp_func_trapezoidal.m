clc;
clear;
close all;

%{
a = 0
b = 0.6
N = 6
f = @(x)(x.*sin(x))
%}

% Input
a = input('Enter a: ');
b = input('Enter b: ');
N = input('Enter N: ');
f = input('Ent func: ');

% Algorithm
y = f(linspace(a, b, N+1));
h = (b-a)/N;

NIntF = (y(1) + y(end))/2;
for i = 2:N
    NIntF = NIntF + y(i);
end
NIntF = NIntF*h;

% Output
fprintf("NIntF = %.10f\n", NIntF);

% Compare
IntF = integral(f, a, b);
fprintf("IntF = %.10f\nError = %.10f\n", IntF, abs(NIntF - IntF));

% **************************************************^**************************************************
% *****************************# Copyright by Ali Forouzandeh Hafshejani #*****************************
% ******************************# Scientific Computing Specialist 20@21 #******************************
% **************************************************^**************************************************