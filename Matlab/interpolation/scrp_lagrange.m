clc;
clear;
close all;

x = 0:0.25:1;
f = x + log(1 + x);

if size(x, 2)==1
    x = x';
end
if size(f, 1)==1
    f = f';
end

n = length(f);
L = ones(n, 1);
for i = 1:n
    for j = 1:n
        if i ~= j
            L(i) = L(i)/(x(i) - x(j));
        end
    end
end

fprintf("x\t\t\t\t|f\t\t\t\tL\n");
for i = 1:n
    fprintf("%.10f\t|%.10f\t%.10f\t", x(i), f(i), L(i));
    for j = 1:n
        if i ~= j
            fprintf("(x - %.10f)", x(j));
        end
    end
    fprintf("\n");
end

% **************************************************^**************************************************
% *****************************# Copyright by Ali Forouzandeh Hafshejani #*****************************
% ******************************# Scientific Computing Specialist 20@20 #******************************
% **************************************************^**************************************************