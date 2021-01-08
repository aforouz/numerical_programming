clc;
clear;
close all;

%{
a = 3;
e = 0.00001;
F = @(x)(cos(2.*x) + sin(2.*x) + x - 1);
df = @(x)(2.*cos(2.*x) - 2.*sin(2.*x) + 1);
d2f = @(x)(-4.*cos(2.*x) - 4.*sin(2.*x));
%}

% Input
a = input('Enter a: ');
e = input('Enter e: ');
F = input('Enter f: ');
df = input('Enter df: ');
d2f = input('Enter d2f: ');

% Algorithm
fprintf("I\ta\t\t\t\tf(a)\t\t\tdf(a)\t\t\tddf(a)\t\t\tc\t\t\t\tf(c)\n");
for i = 1:100
    af = F(a);
    adf = df(a);
	ad2f = d2f(a);
    NsolF = a - 2*af*adf/(2*adf^2 - af*ad2f);
    NvalF = F(NsolF);
    fprintf("%d)\t%.10f\t%.10f\t%.10f\t%.10f\t%.10f\t%.10f\n", i, a, af, adf, ad2f, NsolF, NvalF);
    if abs(NvalF) < e
        break;
    end
    a = NsolF;
end

% Output
fprintf("NsolF = %.10f\n", NsolF);

% Compare
EsolF = fzero(F, a);
fprintf("EsolF = %.10f\nError = %.10f\n", EsolF, abs(EsolF - NsolF));

% **************************************************^**************************************************
% *****************************# Copyright by Ali Forouzandeh Hafshejani #*****************************
% ******************************# Scientific Computing Specialist 20@21 #******************************
% **************************************************^**************************************************