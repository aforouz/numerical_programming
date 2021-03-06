%{
x = [0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6]
y = [0, 0.0100, 0.0397, 0.0887, 0.1558, 0.2397, 0.3388]
%}

function [NintF] = func_tbl_simpson_1_3(x, y)
    
% Algorithm
N = length(y)-1;
h = (x(2) - x(1));

NintFo = 0;
for i = 2:2:N
    NintFo = NintFo + y(i);
end

NintFe = 0;
for i = 3:2:N
    NintFe = NintFe + y(i);
end

NintF = 4*NintFo + 2*NintFe + y(1) + y(end);
NintF = NintF*h/3;

% **************************************************^**************************************************
% *****************************# Copyright by Ali Forouzandeh Hafshejani #*****************************
% ******************************# Scientific Computing Specialist 20@21 #******************************
% **************************************************^**************************************************