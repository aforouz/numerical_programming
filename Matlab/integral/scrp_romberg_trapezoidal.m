clc;
clear;
close all;

f = @(x)(log(1 + sqrt(x))./(x.^2.*sin(x)));
d = 5;
a = 2;
b = 2.5;

N = 10;
err = 0.5 * 10^-d;
T = zeros(N+1);
T(1, 1) = (f(a)+f(b))*(b-a)/2;

for i = 1:N
    for p = 0:i
        if p
            T(i+1, p+1) = (4^p*T(i+1, p) - T(i, p))/(4^p - 1);
        else
            h = (b-a)/2^i;
            xi = a:h:b;
            T(i+1, p+1) = h*(sum(f(xi(1:end))) - (f(a) + f(b))/2);
        end
    end
    if abs(T(p+1, p+1) - T(p, p)) < err
        T = T(1:p+1, 1:p+1);
        break;
    end
end

NIntF = T(end, end);

IntF = integral(f, a, b);
fprintf("NIntF = %.10f\nTIntF = %.10f\nError = %.10f\n", NIntF, IntF, abs(NIntF - IntF));

% **************************************************^**************************************************
% *****************************# Copyright by Ali Forouzandeh Hafshejani #*****************************
% ******************************# Scientific Computing Specialist 20@20 #******************************
% **************************************************^**************************************************