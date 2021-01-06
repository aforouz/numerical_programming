%{
x = [0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6]
y = [0, 0.0100, 0.0397, 0.0887, 0.1558, 0.2397, 0.3388]
%}

function [NIntF] = func_tbl_simpson_3_8(x, y)

% Algorithm
N = length(y)-1;
h = (x(2) - x(1));

NIntFO = 0;
for i = 2:3:N
    NIntFO = NIntFO + y(i) + y(i+1);
end

NIntFE = 0;
for i = 4:3:N
    NIntFE = NIntFE + y(i);
end

NIntF = 3*NIntFO + 2*NIntFE + y(1) + y(end);
NIntF = NIntF*h*3/8;

% Output
fprintf("NIntF = %.10f\n", NIntF);

% **************************************************^**************************************************
% *****************************# Copyright by Ali Forouzandeh Hafshejani #*****************************
% ******************************# Scientific Computing Specialist 20@21 #******************************
% **************************************************^**************************************************