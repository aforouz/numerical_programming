clc;
clear;
close all;

x = [0, 0.25, 0.5, 0.75, 1];
f = [0, 0.47314, 0.90546, 1.30962, 1.69375];

if size(x, 2)==1
    x = x';
end
if size(f, 1)==1
    f = f';
end

n = length(f);
A = [n, sum(x), sum(x.^2);
    sum(x), sum(x.^2), sum(x.^3);
    sum(x.^2), sum(x.^3), sum(x.^4)];
B = [sum(f); x*f; x.^2*f];

abc = A\B;

fprintf("|%.10f\t%.10f\t%.10f\t||c| |%.10f\t|\n", A(1, 1), A(1, 2), A(1, 3), B(1));
fprintf("|%.10f\t%.10f\t%.10f\t||b|=|%.10f\t|\n", A(2, 1), A(2, 2), A(2, 3), B(2));
fprintf("|%.10f\t%.10f\t%.10f\t||a| |%.10f\t|\n", A(3, 1), A(3, 2), A(3, 3), B(3));
fprintf("\ny = a*x^2 + b*x + c = %.10f*x^2 + %.10f*x + %.10f\n", abc(3), abc(2), abc(1));

y = [ones(n, 1), x', x.^2']*abc;
plot(x, f, '*', x, y, '-')

% **************************************************^**************************************************
% *****************************# Copyright by Ali Forouzandeh Hafshejani #*****************************
% ******************************# Scientific Computing Specialist 20@20 #******************************
% **************************************************^**************************************************