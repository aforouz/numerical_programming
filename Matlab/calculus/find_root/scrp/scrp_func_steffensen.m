% Start
clc;
clear;
close all;

%{
func = @(x)(1 - exp(x).*tan(x));
ax = 0.8;
err = 0.0001;
Niter = 100;
%}

% Function
func = input('Enter f: ');

% Input
ax = input('Enter a: ');
err = input('Enter e: ');
Niter = input('Enter N: ');

% Algorithm
fprintf('I\ta\t\t\t\tf(a)\t\t\tdf(a)\t\t\tc\t\t\t\tf(c)\n');
Gfunc = @(x)(func(x + func(x))./func(x) - 1);
for iter = 1:Niter
    af = func(ax);
    aGf = Gfunc(ax);
    NsolF = ax - af/aGf;
    NvalF = func(NsolF);
    fprintf('%d)\t%.10f\t%.10f\t%.10f\t%.10f\t%.10f\n', iter, ax, af, aGf, NsolF, NvalF);
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