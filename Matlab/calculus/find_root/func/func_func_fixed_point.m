% Start

%{
func = @(x)(x - 1 - 0.3.*cos(x));
Gfunc = @(x)(1 + 0.3.*cos(x));
ax = 1.5;
err = 0.00001;
Niter = 100;
%}

% Function
function [NsolF, EsolF, NsolE] = func_func_fixed_point(ax, err, func, Gfunc, Niter)

% Input
if nargin < 5
    Niter = 100;
end

% Algorithm
for iter = 1:Niter
    NsolF = Gfunc(ax);
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