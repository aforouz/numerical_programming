%{
xF = 0.34;
x = [0, 0.25, 0.5, 0.75, 1];
F = @(x)(x.*sin(x));
%}

function [NvalF, EvalF, NvalE] = func_func_newton_divided_difference(xF, x, F)

% Algorithm
y = F(x);
N = length(y);
A = zeros(N);
A(:, 1) = y';
for j = 2:N
    for i = j:N
        A(i, j) = (A(i, j-1)-A(i-1, j-1))/(x(i)-x(i-j+1));
    end
end
X = ones(1, N);
for i = 1:N-1
    X(i+1) = (xF - x(i))*X(i);
end
NvalF = X*diag(A);

% Compare
EvalF = F(xF);
NvalE = abs(EvalF - NvalF);

% **************************************************^**************************************************
% *****************************# Copyright by Ali Forouzandeh Hafshejani #*****************************
% ******************************# Scientific Computing Specialist 20@20 #******************************
% **************************************************^**************************************************