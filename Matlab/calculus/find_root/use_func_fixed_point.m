clc;
clear;
close all;

% Input
a = 1.5;
e = 0.00001;
F = @(x)(x - 1 - 0.3.*cos(x));
g = @(x)(1 + 0.3.*cos(x));

% Algorithm
fprintf("I\ta\t\t\t\tg(a)\t\t\tf(a)\n");
for i = 1:100
    NsolF = g(a);
    NvalF = F(NsolF);
    fprintf("%d)\t%.10f\t%.10f\t%.10f\n", i, a, NsolF, NvalF);
    if abs(NvalF) < e
        break;
    end
    a = NsolF;
end

% Output
fprintf("\nNsolF = %.10f\n", NsolF);

% Compare
EsolF = fzero(F, a);
fprintf("EsolF = %.10f\nError = %.10f\n", EsolF, abs(EsolF - NsolF));

% **************************************************^**************************************************
% *****************************# Copyright by Ali Forouzandeh Hafshejani #*****************************
% ******************************# Scientific Computing Specialist 20@21 #******************************
% **************************************************^**************************************************