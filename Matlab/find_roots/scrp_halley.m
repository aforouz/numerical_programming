clc;
clear;
close all;

f = @(x)(cos(2*x) + sin(2*x) + x - 1);
df = @(x)(2*cos(2*x) - 2*sin(2*x) + 1);
ddf = @(x)(-4*cos(2*x) - 4*sin(2*x));
d = 4;
a = 3;

N = 100;
err = 0.5 * 10^-d;
fprintf("I\ta\t\t\t\tf(a)\t\t\tdf(a)\t\t\tddf(a)\t\t\tc\t\t\t\tf(c)\n");
for i = 1:N
    af = f(a);
    adf = df(a);
	addf = ddf(a);
    c = a - 2*af*adf/(2*adf^2 - af*addf);
    cf = f(c);
    fprintf("%d)\t%.10f\t%.10f\t%.10f\t%.10f\t%.10f\t%.10f\n", i, a, af, adf, addf, c, cf);
    if abs(cf) < err
        break;
    end
    a = c;
end

% **************************************************^**************************************************
% *****************************# Copyright by Ali Forouzandeh Hafshejani #*****************************
% ******************************# Scientific Computing Specialist 20@20 #******************************
% **************************************************^**************************************************