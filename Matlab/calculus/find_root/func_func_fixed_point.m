%{
a = 1.5;
e = 0.00001;
F = @(x)(x - 1 - 0.3.*cos(x));
g = @(x)(1 + 0.3.*cos(x));
%}

function [NsolF, EsolF, NsolE] = func_func_fixed_point(a, e, F, g)

% Algorithm
for i = 1:100
    NsolF = g(a);
    Nf = F(NsolF);
    if abs(Nf) < e
        break;
    end
    a = NsolF;
end

% Compare
EsolF = fzero(F, a);
NsolE = abs(EsolF - NsolF);

% **************************************************^**************************************************
% *****************************# Copyright by Ali Forouzandeh Hafshejani #*****************************
% ******************************# Scientific Computing Specialist 20@21 #******************************
% **************************************************^**************************************************