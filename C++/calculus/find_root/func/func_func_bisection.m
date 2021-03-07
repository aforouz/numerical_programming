%{
ax = 0;
bx = 2;
err = 0.00001;
func = @(x)(x.^4/4 + x.^2/2 + x - 2);
%}

function [NsolF, EsolF, NsolE] = func_func_bisection(ax, bx, err, func, Niter)

if nargin < 5
    Niter = 100;
end

% Algorithm
for iter = 1:Niter
    af = func(ax);
%     bf = f(b);
    NsolF = (ax+bx)/2;
    Nf = func(NsolF);
    if abs(Nf) < err
        break;
    elseif af*Nf > 0
        ax = NsolF;
    else
        bx = NsolF;
    end
end

% Compare
EsolF = fzero(func, (ax+bx)/2);
NsolE = abs(EsolF - NsolF);

% **************************************************^**************************************************
% *****************************# Copyright by Ali Forouzandeh Hafshejani #*****************************
% ******************************# Scientific Computing Specialist 20@21 #******************************
% **************************************************^**************************************************