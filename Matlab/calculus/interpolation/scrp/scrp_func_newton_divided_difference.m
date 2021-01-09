clc;
clear;
close all;

%{
xF = 0.34;
x = [0, 0.25, 0.5, 0.75, 1];
F = @(x)(x.*sin(x));
%}

xF = input('Enter xF: ');
x = input('Enter x: ');
F = input('Enter f: ');

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

% Output
fprintf('\nx\t\t\t\t|f1\t\t\t\t');
for i = 2:N-1
    fprintf('f%d\t\t\t\t', i);
end
fprintf('f%d\n', N);
for i = 1:N
    fprintf('%.10f\t|', x(i));
    for j = 1:i
        fprintf('%.10f\t', A(i, j));
    end
    fprintf('\n');
end
fprintf('\nNvalF = %.10f\n', NvalF);

% Compare
EvalF = F(xF);
fprintf('EvalF = %.10f\nError = %.10f\n', EvalF, abs(EvalF - NvalF));

% **************************************************^**************************************************
% *****************************# Copyright by Ali Forouzandeh Hafshejani #*****************************
% ******************************# Scientific Computing Specialist 20@20 #******************************
% **************************************************^**************************************************