%{
xF = 0.34;
x = [0, 0.25, 0.5, 0.75, 1]
y = [0, 0.47314, 0.90546, 1.30962, 1.69375];
%}

function [NvalF] = func_tbl_lagrange(xF, x, y)

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

% **************************************************^**************************************************
% *****************************# Copyright by Ali Forouzandeh Hafshejani #*****************************
% ******************************# Scientific Computing Specialist 20@21 #******************************
% **************************************************^**************************************************