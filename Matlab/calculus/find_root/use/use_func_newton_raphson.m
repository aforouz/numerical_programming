% Start
clc;
clear;
close all;

% Function
func = @(x)(x.^6 - x - 1);
Dfunc = @(x)(6.*x.^5 - 1);

% Input
ax = 1.5;
err = 0.0001;
Niter = 100;

% Algorithm
fprintf('I\ta\t\t\t\tf(a)\t\t\tdf(a)\t\t\tc\t\t\t\tf(c)\n');
for iter = 1:Niter
    af = func(ax);
    aDf = Dfunc(ax);
    NsolF = ax - af/aDf;
    NvalF = func(NsolF);
    fprintf('%d)\t%.10f\t%.10f\t%.10f\t%.10f\t%.10f\n', iter, ax, af, aDf, NsolF, NvalF);
    if abs(NvalF) < err
        break;
    end
    ax = NsolF;
end

% Output
fprintf('\nNsolF = %.10f\n', NsolF);

% Compare
EsolF = fzero(func, ax);
fprintf('EsolF = %.10f\nError = %.10f\n', EsolF, abs(EsolF - NsolF));

% **************************************************^**************************************************
% *****************************# Copyright by Ali Forouzandeh Hafshejani #*****************************
% ******************************# Scientific Computing Specialist 20@21 #******************************
% **************************************************^**************************************************