clc;
clear;
close all;

f = @(x)(x.*sin(x));
N = 10;
a = 0;
b = 1;

xi = linspace(a, b, N+1);
h = (b-a)/N;

NIntF = (f(a) + f(b))/2;
if N > 1
    for i = 2:N
        NIntF = NIntF + f(xi(i));
    end
end
NIntF = NIntF*h;

IntF = integral(f, a, b);
fprintf("NIntF = %.10f\nTIntF = %.10f\nError = %.10f\n", NIntF, IntF, abs(NIntF - IntF));

% **************************************************^**************************************************
% *****************************# Copyright by Ali Forouzandeh Hafshejani #*****************************
% ******************************# Scientific Computing Specialist 20@20 #******************************
% **************************************************^**************************************************