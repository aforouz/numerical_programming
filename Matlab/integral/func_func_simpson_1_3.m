%{
a = 0
b = .6
N = 6
f = @(x)(x.*sin(x))
%}

function [NIntF, IntF, IntErr] = func_func_simpson_1_3(a, b, N, f)
    
% Algorithm
x = linspace(a, b, N+1);
y = f(x);
h = (x(2) - x(1));

NIntFO = 0;
for i = 2:2:N
    NIntFO = NIntFO + y(i);
end

NIntFE = 0;
for i = 3:2:N
    NIntFE = NIntFE + y(i);
end

NIntF = 4*NIntFO + 2*NIntFE + y(1) + y(end);
NIntF = NIntF*h/3;

% Compare
IntF = integral(f, a, b);
IntErr = abs(NIntF - IntF);

% **************************************************^**************************************************
% *****************************# Copyright by Ali Forouzandeh Hafshejani #*****************************
% ******************************# Scientific Computing Specialist 20@21 #******************************
% **************************************************^**************************************************