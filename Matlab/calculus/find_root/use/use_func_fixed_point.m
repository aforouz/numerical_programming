% Start
clc;
clear;
close all;

% Function
func = @(x)(x - 1 - 0.3.*cos(x));
Gfunc = @(x)(1 + 0.3.*cos(x));

% Input
ax = 1.5;
err = 0.00001;
Niter = 100;

% Algorithm
fprintf('I\ta\t\t\t\tg(a)\t\t\tf(a)\n');
for iter = 1:Niter
    NsolF = Gfunc(ax);
    NvalF = func(NsolF);
    fprintf('%d)\t%.10f\t%.10f\t%.10f\n', iter, ax, NsolF, NvalF);
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