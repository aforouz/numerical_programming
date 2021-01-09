%{
a = 1.5;
e = 0.0001;
F = @(x)(x.^6 - x - 1);
df = @(x)(6.*x.^5 - 1);
%}

function [NsolF, EsolF, NsolE] = func_func_newton_raphson(a, e, F, df)

% Algorithm
for i = 1:100
    af = F(a);
    adf = df(a);
    NsolF = a - af/adf;
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