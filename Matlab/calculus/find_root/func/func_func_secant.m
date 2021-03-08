% Start

%{
func = @(x)(x.^4/4 + x.^2/2 + x - 2);
ax = 0;
bx = 2;
err = 0.00001;
Niter = 100;
%}

% Function
function [NsolF, EsolF, NsolE] = func_func_secant(ax, bx, err, func, Niter)

% Input
if nargin < 5
    Niter = 100;
end

% Algorithm
for iter = 1:Niter
    af = func(ax);
    bf = func(bx);
    NsolF = (ax*bf - bx*af)/(bf-af);
    Nf = func(NsolF);
    if abs(Nf) < err
        break;
    end
    ax = bx;
    bx = NsolF;
end

% Compare
EsolF = fzero(func, (ax+bx)/2);
NsolE = abs(EsolF - NsolF);

% **************************************************^**************************************************
% *****************************# Copyright by Ali Forouzandeh Hafshejani #*****************************
% ******************************# Scientific Computing Specialist 20@21 #******************************
% **************************************************^**************************************************