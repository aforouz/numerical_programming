clc;
clear;
close all;

f = @(x)(x^4/4 + x^2/2 + x - 2);
d = 6;
a = 0;
b = 2;

N = 100;
err = 0.5 * 10^-d;
fprintf("I\ta\t\t\t\tf(a)\t\t\tb\t\t\t\tf(b)\t\t\tc\t\t\t\tf(c)\n");
for i = 1:N
    af = f(a);
    bf = f(b);
    c = (a*bf - b*af)/(bf-af);
    cf = f(c);
    fprintf("%d)\t%.10f\t%.10f\t%.10f\t%.10f\t%.10f\t%.10f\n",...
    i, a, af, b, bf, c, cf);
    if abs(cf) < err
        break;
    end
    a = b;
    b = c;
end

% **************************************************^**************************************************
% *****************************# Copyright by Ali Forouzandeh Hafshejani #*****************************
% ******************************# Scientific Computing Specialist 20@20 #******************************
% **************************************************^**************************************************