%{
a = 0
b = .6
N = 6
F = @(x)(x.*sin(x))
%}

function [NintF, EintF, NintE] = func_func_trapezoidal(a, b, N, F)
    
% Algorithm
y = F(linspace(a, b, N+1));
h = (b-a)/N;

NintF = (y(1) + y(end))/2;
for i = 2:N
    NintF = NintF + y(i);
end
NintF = NintF*h;

% Compare
EintF = integral(F, a, b);
NintE = abs(EintF - NintF);

% **************************************************^**************************************************
% *****************************# Copyright by Ali Forouzandeh Hafshejani #*****************************
% ******************************# Scientific Computing Specialist 20@21 #******************************
% **************************************************^**************************************************