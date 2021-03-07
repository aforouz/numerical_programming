%{
a = 3;
e = 0.00001;
F = @(x)(cos(2.*x) + sin(2.*x) + x - 1);
df = @(x)(2.*cos(2.*x) - 2.*sin(2.*x) + 1);
d2f = @(x)(-4.*cos(2.*x) - 4.*sin(2.*x));
%}

function [NsolF, EsolF, NsolE] = func_func_halley(a, e, F, df, d2f)

% Algorithm
for i = 1:100
    af = F(a);
    adf = df(a);
	ad2f = d2f(a);
    NsolF = a - 2*af*adf/(2*adf^2 - af*ad2f);
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