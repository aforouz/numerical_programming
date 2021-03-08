% Start

%{
func = @(x)(cos(2.*x) + sin(2.*x) + x - 1);
Dfunc = @(x)(2.*cos(2.*x) - 2.*sin(2.*x) + 1);
D2func = @(x)(-4.*cos(2.*x) - 4.*sin(2.*x));
ax = 3;
err = 0.00001;
Niter = 100;
%}

% Function
function [NsolF, EsolF, NsolE] = func_func_halley(ax, err, func, Dfunc, D2func, Niter)

% Input
if nargin < 6
    Niter = 100;
end

% Algorithm
for iter = 1:Niter
    af = func(ax);
    aDf = Dfunc(ax);
	aD2f = D2func(ax);
    NsolF = ax - 2*af*aDf/(2*aDf^2 - af*aD2f);
    Nf = func(NsolF);
    if abs(Nf) < err
        break;
    end
    ax = NsolF;
end

% Compare
EsolF = fzero(func, ax);
NsolE = abs(EsolF - NsolF);

% **************************************************^**************************************************
% *****************************# Copyright by Ali Forouzandeh Hafshejani #*****************************
% ******************************# Scientific Computing Specialist 20@21 #******************************
% **************************************************^**************************************************