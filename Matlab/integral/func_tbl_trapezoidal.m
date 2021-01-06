%{
x = [0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6];
y = [0, 0.0100, 0.0397, 0.0887, 0.1558, 0.2397, 0.3388];
%}

function [NIntF] = func_tbl_trapezoidal(x, y)
    
% Algorithm
N = length(y)-1;
h = (x(2) - x(1));

NIntF = (y(1) + y(end))/2;
for i = 2:N
    NIntF = NIntF + y(i);
end
NIntF = NIntF*h;

% **************************************************^**************************************************
% *****************************# Copyright by Ali Forouzandeh Hafshejani #*****************************
% ******************************# Scientific Computing Specialist 20@21 #******************************
% **************************************************^**************************************************