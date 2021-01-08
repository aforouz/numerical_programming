%{
a = 0;
b = 2;
e = 0.00001;
F = @(x)(x.^4/4 + x.^2/2 + x - 2);
%}

function [NsolF, EsolF, NsolE] = func_func_false_position(a, b, e, F)

% Algorithm
for i = 1:100
    af = F(a);
    bf = F(b);
    NsolF = (a*bf - b*af)/(bf - af);
    Nf = F(NsolF);
    if abs(Nf) < e
        break;
    elseif af*Nf > 0
        a = NsolF;
    else
        b = NsolF;
    end
end

% Compare
EsolF = fzero(F, (a+b)/2);
NsolE = abs(EsolF - NsolF);

% **************************************************^**************************************************
% *****************************# Copyright by Ali Forouzandeh Hafshejani #*****************************
% ******************************# Scientific Computing Specialist 20@21 #******************************
% **************************************************^**************************************************