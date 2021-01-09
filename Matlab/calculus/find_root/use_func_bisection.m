clc;
clear;
close all;

% Input
a = 0;
b = 2;
e = 0.00001;
F = @(x)(x.^4/4 + x.^2/2 + x - 2);

% Algorithm
fprintf("I\ta\t\t\t\tf(a)\t\t\tb\t\t\t\tf(b)\t\t\tc\t\t\t\tf(c)\n");
for i = 1:100
    af = F(a);
    bf = F(b);
    NsolF = (a+b)/2;
    NvalF = F(NsolF);
    fprintf("%d)\t%.10f\t%.10f\t%.10f\t%.10f\t%.10f\t%.10f\n", i, a, af, b, bf, NsolF, NvalF);
    if abs(NvalF) < e
        break;
    elseif af*NvalF > 0
        a = NsolF;
    else
        b = NsolF;
    end
end

% Output
fprintf("\nNsolF = %.10f\n", NsolF);

% Compare
EsolF = fzero(F, (a+b)/2);
fprintf("EsolF = %.10f\nError = %.10f\n", EsolF, abs(EsolF - NsolF));

% **************************************************^**************************************************
% *****************************# Copyright by Ali Forouzandeh Hafshejani #*****************************
% ******************************# Scientific Computing Specialist 20@21 #******************************
% **************************************************^**************************************************