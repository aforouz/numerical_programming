clc;
clear;
close all;

% Input
a = 1.5;
e = 0.0001;
F = @(x)(x.^6 - x - 1);
df = @(x)(6.*x.^5 - 1);

% Algorithm
fprintf('I\ta\t\t\t\tf(a)\t\t\tdf(a)\t\t\tc\t\t\t\tf(c)\n');
for i = 1:100
    af = F(a);
    adf = df(a);
    NsolF = a - af/adf;
    NvalF = F(NsolF);
    fprintf('%d)\t%.10f\t%.10f\t%.10f\t%.10f\t%.10f\n', i, a, af, adf, NsolF, NvalF);
    if abs(NvalF) < e
        break;
    end
    a = NsolF;
end

% Output
fprintf('\nNsolF = %.10f\n', NsolF);

% Compare
EsolF = fzero(F, a);
fprintf('EsolF = %.10f\nError = %.10f\n', EsolF, abs(EsolF - NsolF));

% **************************************************^**************************************************
% *****************************# Copyright by Ali Forouzandeh Hafshejani #*****************************
% ******************************# Scientific Computing Specialist 20@21 #******************************
% **************************************************^**************************************************