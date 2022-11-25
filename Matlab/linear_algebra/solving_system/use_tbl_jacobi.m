clc;
clear;
close all;

% Input
x = [1, -1, 0];
b = [0.2, 0.3, 0.5];
A = [0.8, -0.2, 0.3; 0.3, -0.5, 0.1; 0.2, 0.7, 1];
e = 0.001;

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
Tj = D\(U + L);
cj = D\b;
for k = 2:N
    X(:, k) = Tj*X(:, k-1) + cj;
    if norm(X(:, k) - X(:, k-1)) < e
        break
    end
end
X = X(:, 1:k);
NsolS = X(:, end);

% Output
fprintf('Tj =\n');
for i = 1:n
    fprintf('|');
    for j = 1:n
        fprintf('%.10f\t', Tj(i, j));
    end
    fprintf('|\n');
end
fprintf('\ncj =\n');
fprintf('|%.10f\t|\n', cj);
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
% ******************************# Scientific Computing Specialist 20@21 #******************************
% **************************************************^**************************************************