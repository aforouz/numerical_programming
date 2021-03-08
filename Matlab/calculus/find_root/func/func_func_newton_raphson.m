% Start

%{
func = @(x)(x.^6 - x - 1);
Dfunc = @(x)(6.*x.^5 - 1);
ax = 1.5;
err = 0.0001;
Niter = 100;
%}

% Function
function [NsolF, EsolF, NsolE] = func_func_newton_raphson(func, Dfunc, ax, err, Niter)

% Input
if nargin < 4
    err = 0.00001;
end
if nargin < 5
    Niter = 100;
end

% Algorithm
for iter = 1:Niter
    af = func(ax);
    adf = Dfunc(ax);
    NsolF = ax - af/adf;
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