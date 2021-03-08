% Start
clc;
clear;
close all;

%{
func = @(x)(cos(2.*x) + sin(2.*x) + x - 1);
Dfunc = @(x)(2.*cos(2.*x) - 2.*sin(2.*x) + 1);
D2func = @(x)(-4.*cos(2.*x) - 4.*sin(2.*x));
ax = 3;
err = 0.00001;
Niter = 100;
%}

% Function
func = input('Enter f: ');
Dfunc = input('Enter D(f): ');
D2func = input('Enter D2(f): ');

% Input
ax = input('Enter a: ');
err = input('Enter e: ');
Niter = input('Enter N: ');

% Algorithm
fprintf('\nI\ta\t\t\t\tf(a)\t\t\tdf(a)\t\t\tddf(a)\t\t\tc\t\t\t\tf(c)\n');
for iter = 1:Niter
    af = func(ax);
    aDf = Dfunc(ax);
	aD2f = D2func(ax);
    NsolF = ax - 2*af*aDf/(2*aDf^2 - af*aD2f);
    NvalF = func(NsolF);
    fprintf('%d)\t%.10f\t%.10f\t%.10f\t%.10f\t%.10f\t%.10f\n', iter, ax, af, aDf, aD2f, NsolF, NvalF);
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