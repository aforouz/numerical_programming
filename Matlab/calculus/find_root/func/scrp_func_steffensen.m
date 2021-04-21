% Start

%{
func = @(x)(1 - exp(x).*tan(x));
ax = 0.8;
err = 0.0001;
Niter = 100;
%}

% Function
function [NsolF, EsolF, NsolE] = func_func_steffensen(func, ax, err, Niter)

% Input
if nargin < 3
    err = 0.00001;
end
if nargin < 4
    Niter = 100;
end

% Algorithm
Gfunc = @(x)(func(x + func(x))./func(x) - 1);
for iter = 1:Niter
    af = func(ax);
    aGf = Gfunc(ax);
    NsolF = ax - af/aGf;
    NvalF = func(NsolF);
    if abs(NvalF) < err
        break;
    end
    ax = NsolF;
end

% Compare
EsolF = fzero(func, ax);
NsolE = abs(EsolF - NsolF);

% End
return

% **************************************************^**************************************************
% *****************************# Copyright by Ali Forouzandeh Hafshejani #*****************************
% ******************************# Scientific Computing Specialist 20@21 #******************************
% **************************************************^**************************************************