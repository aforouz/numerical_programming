%{
xF = 0.34;
x = [0, 0.25, 0.5, 0.75, 1];
F = @(x)(x.*sin(x));
%}

function [NvalF, EvalF, NvalE] = func_func_lagrange(xF, x, F)

% Algorithm
y = F(x);
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

% Compare
EvalF = F(xF);
NvalE = abs(EvalF - NvalF);

% **************************************************^**************************************************
% *****************************# Copyright by Ali Forouzandeh Hafshejani #*****************************
% ******************************# Scientific Computing Specialist 20@21 #******************************
% **************************************************^**************************************************