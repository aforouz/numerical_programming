clc;
clear;
close all;

% Input
x = [0, 0, 0];
b = [12, -10, 6];
A = [8, -2, 0; -1, 5, 1;0, -1, 4];
e = 1e-4;

% SOR
w = 2/(1 + sqrt(1 - abs(eigs(tril(A)\triu(A, 1), 1))));

% Algorithm
N = 100;
n = length(x);
b = b';
x = x';
X = zeros(n, N);
X(:, 1) = x;

D = diag(diag(A));
U = -triu(A, 1);
L = -tril(A, -1);
Tw = (D - w*L)\((1-w)*D + w*U);
cw = (D - w*L)\(w*b);
for k = 2:N
    X(:, k) = Tw*X(:, k-1) + cw;
    if norm(X(:, k) - X(:, k-1)) < e
        break
    end
end
X = X(:, 1:k);
NsolS = X(:, end);

% Output
fprintf('Tw =\n');
for i = 1:n
    fprintf('|');
    for j = 1:n
        fprintf('%.10f\t', Tw(i, j));
    end
    fprintf('|\n');
end
fprintf('\ncw =\n');
fprintf('|%.10f\t|\n', cw);
for i = 1:k
    fprintf('\nx(%d) =\n', i-1);
    fprintf('|%.10f\t|\n', X(:, i));
end
fprintf('\nNsolS =\n');
fprintf('|%.10f\t|\n', NsolS);

% Compare
EsolS = A\b;
fprintf('\nEsolS =\n');
fprintf('|%.10f\t|\n', EsolS);
fprintf('\nError = %.10f\n', norm(EsolS - NsolS));

% **************************************************^**************************************************
% *****************************# Copyright by Ali Forouzandeh Hafshejani #*****************************
% ******************************# Scientific Computing Specialist 20@22 #******************************
% **************************************************^**************************************************