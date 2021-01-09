clc;
clear;
close all;

% Input
xF = 0.34;
x = [0, 0.25, 0.5, 0.75, 1];
y = [0, 0.47314, 0.90546, 1.30962, 1.69375];

% Algorithm
N = length(y);
L = ones(1, N);
pL = L;
for i = 1:N
    for j = 1:N
        if i ~= j
            L(i) = L(i)*(xF - x(j))/(x(i) - x(j));
            pL(i) = pL(i)/(x(i) - x(j));
        end
    end
end
NvalF = L*y';

% Output
fprintf('x\t\t\t\t|f\t\t\t\tL\t\t\t\tpL\t\t\t\tp\n');
for i = 1:N
    fprintf('%.10f\t|%.10f\t%.10f\t%.10f\t', x(i), y(i), L(i), pL(i));
    for j = 1:N
        if i ~= j
            fprintf('(x - %.10f)', x(j));
        end
    end
    fprintf('\n');
end
fprintf('\nNvalF = %.10f\n', NvalF);

% **************************************************^**************************************************
% *****************************# Copyright by Ali Forouzandeh Hafshejani #*****************************
% ******************************# Scientific Computing Specialist 20@21 #******************************
% **************************************************^**************************************************