% Start
clc;
clear;
close all;

%{
func = @(x)(x.^4/4 + x.^2/2 + x - 2);
ax = 0;
bx = 2;
err = 0.00001;
Niter = 100;
%}

% Function
func = input('Enter f: ');

% Input
ax = input('Enter a: ');
bx = input('Enter b: ');
err = input('Enter e: ');
Niter = input('Enter N: ');

% Algorithm
fprintf('\nI\ta\t\t\t\tf(a)\t\t\tb\t\t\t\tf(b)\t\t\tc\t\t\t\tf(c)\n');
for iter = 1:Niter
    af = func(ax);
    bf = func(bx);
    NsolF = (ax*bf - bx*af)/(bf-af);
    NvalF = func(NsolF);
    fprintf('%d)\t%.10f\t%.10f\t%.10f\t%.10f\t%.10f\t%.10f\n', iter, ax, af, bx, bf, NsolF, NvalF);
    if abs(NvalF) < err
        break;
    end
    ax = bx;
    bx = NsolF;
end

% Output
fprintf('\nNsolF = %.10f\n', NsolF);

% Compare
EsolF = fzero(func, (ax+bx)/2);
fprintf('EsolF = %.10f\nError = %.10f\n', EsolF, abs(EsolF - NsolF));

% **************************************************^**************************************************
% *****************************# Copyright by Ali Forouzandeh Hafshejani #*****************************
% ******************************# Scientific Computing Specialist 20@21 #******************************
% **************************************************^**************************************************