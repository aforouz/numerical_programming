clc;
clear;
close all;

f = @(x)(1./(1+x));
N = 8;
a = 1;
b = 2;

xi = linspace(a, b, N+1);
h = (b-a)/N;

NIntFO = 0;
if N > 1
    for i = 2:2:N
        NIntFO = NIntFO + f(xi(i));
    end
end

NIntFE = 0;
if N > 2
    for i = 3:2:N
        NIntFE = NIntFE + f(xi(i));
    end
end

NIntF = 4*NIntFO + 2*NIntFE + f(a) + f(b);
NIntF = NIntF*h/3;

IntF = integral(f, a, b);
fprintf("NIntF = %.10f\nIntF = %.10f\nError = %.10f\n", NIntF, IntF, abs(NIntF - IntF));

% **************************************************^**************************************************
% *****************************# Copyright by Ali Forouzandeh Hafshejani #*****************************
% ******************************# Scientific Computing Specialist 20@20 #******************************
% **************************************************^**************************************************