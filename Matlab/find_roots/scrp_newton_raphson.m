clc;
clear;
close all;

f = @(x)(x^6 - x - 1);
df = @(x)(6 * x^5 - 1);
d = 8;
a = 1.5;

N = 100;
err = 0.5 * 10^-d;
fprintf("I\ta\t\t\t\tf(a)\t\t\tdf(a)\t\t\tc\t\t\t\tf(c)\n");
for i = 1:N
    af = f(a);
    adf = df(a);
    c = a - af/adf;
    cf = f(c);
    fprintf("%d)\t%.10f\t%.10f\t%.10f\t%.10f\t%.10f\n", i, a, af, adf, c, cf);
    if abs(cf) < err
        break;
    end
    a = c;
end

% **************************************************^**************************************************
% *****************************# Copyright by Ali Forouzandeh Hafshejani #*****************************
% ******************************# Scientific Computing Specialist 20@20 #******************************
% **************************************************^**************************************************