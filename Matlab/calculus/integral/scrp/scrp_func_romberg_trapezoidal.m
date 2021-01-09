clc;
clear;
close all;

%{
a = 2;
b = 2.5;
e = 0.00001;
F = @(x)(log(1 + sqrt(x))./(x.^2.*sin(x)));
%}

% Input
a = input('Enter a: ');
b = input('Enter b: ');
e = input('Enter e: ');
F = input('Enter f: ');

% Algorithm
N = 10;
T = zeros(N+1);
T(1, 1) = (F(a)+F(b))*(b-a)/2;

for i = 1:N
    for p = 0:i
        if p
            T(i+1, p+1) = (4^p*T(i+1, p) - T(i, p))/(4^p - 1);
        else
            h = (b-a)/2^i;
            xi = a:h:b;
            T(i+1, p+1) = h*(sum(F(xi(1:end))) - (F(a) + F(b))/2);
        end
    end
    if abs(T(p+1, p+1) - T(p, p)) < e
        T = T(1:p+1, 1:p+1);
        break;
    end
end
NintF = T(end, end);

% Output
fprintf('\nT\t|');
for i = 1:p+1
    fprintf('%d\t\t\t\t', i-1);
end
fprintf('\n----|');
for i = 1:p+1
    fprintf('---------------');
end
fprintf('\n');
for i = 1:p+1
    fprintf('%d\t|', i-1);
    for j = 1:i
        fprintf('%.10f\t', T(i, j));
    end
    fprintf('\n');
end
fprintf('\nNintF = %.10f\n', NintF);

% Compare
EintF = integral(F, a, b);
fprintf('EintF = %.10f\nError = %.10f\n', EintF, abs(EintF - NintF));

% **************************************************^**************************************************
% *****************************# Copyright by Ali Forouzandeh Hafshejani #*****************************
% ******************************# Scientific Computing Specialist 20@21 #******************************
% **************************************************^**************************************************