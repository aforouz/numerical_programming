clc;
clear;
close all;

% Input
xF = 1.2;
yF = 0.8;
x = [0,1,1.5];
y = [0,1,2];
f = [1,2,5; 0,1,4; -0.828,0.172,3.172];

% Algorithm
N = length(x);
Lx = ones(1, N);
for i = 1:N
    for j = 1:N
        if i ~= j
            Lx(i) = Lx(i)*(xF - x(j))/(x(i) - x(j));
        end
    end
end
Ly = ones(1, N);
for i = 1:N
    for j = 1:N
        if i ~= j
            Ly(i) = Ly(i)*(yF - y(j))/(y(i) - y(j));
        end
    end
end

NvalF = 0;
for i = 1:N
    for j = 1:N
        NvalF = NvalF + Lx(i)*Ly(j)*f(i,j);
    end
end

% Output
fprintf('\nNvalF = %.10f\n', NvalF);

% **************************************************^**************************************************
% *****************************# Copyright by Ali Forouzandeh Hafshejani #*****************************
% ******************************# Scientific Computing Specialist 20@21 #******************************
% **************************************************^**************************************************