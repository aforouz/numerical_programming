clc;
clear;
close all;

% Input
xF = 0.34;
x = [0, 0.25, 0.5, 0.75, 1];
y = [0, 0.47314, 0.90546, 1.30962, 1.69375];

% Algorithm
N = length(y);
beta = ones(1, N);
bL = beta;
for i = 1:N
    for j = 1:N
        if i ~= j
            beta(i) = beta(i)/(x(i) - x(j));
        end
    end
end
for i = 1:N
    bL(i) = beta(i)/(xF - x(i));
end
NvalF = bL*y'/sum(bL);

% Output
fprintf('x\t\t\t\t|f\t\t\t\tL\t\t\t\tbL\n');
for i = 1:N
    fprintf('%.10f\t|%.10f\t%.10f\t%.10f\n', x(i), y(i), beta(i), bL(i));
end

fprintf('\nNvalF = %.10f\n', NvalF);

% **************************************************^**************************************************
% *****************************# Copyright by Ali Forouzandeh Hafshejani #*****************************
% ******************************# Scientific Computing Specialist 20@21 #******************************
% **************************************************^**************************************************