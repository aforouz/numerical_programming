%{
a = 0
b = .6
N = 6
f = @(x)(x.*sin(x))
%}

function [NIntF, IntF, IntErr] = func_func_trapezoidal(a, b, N, f)
    
% Algorithm
y = f(linspace(a, b, N+1));
h = (b-a)/N;

NIntF = (y(1) + y(end))/2;
for i = 2:N
    NIntF = NIntF + y(i);
end
NIntF = NIntF*h;

% Compare
IntF = integral(f, a, b);
IntErr = abs(NIntF - IntF);

% **************************************************^**************************************************
% *****************************# Copyright by Ali Forouzandeh Hafshejani #*****************************
% ******************************# Scientific Computing Specialist 20@21 #******************************
% **************************************************^**************************************************