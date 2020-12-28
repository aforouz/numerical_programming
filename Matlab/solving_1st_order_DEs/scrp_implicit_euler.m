clc;
clear;
close all;

f = @(x, y)(y + x^2);
x0 = 0;
y0 = 1;
h = 0.1;
xN = 1;

gh = 0.00001;
gn = 100;
ge = 0.000001;

N = round((xN-x0)/h)+1;
x = x0:h:xN;
y = x;
y(1) = y0;

fprintf("n\tx\t\t\t\ty\n");
fprintf("0)\t%.10f\t%.10f\n", x(1), y(1));

for n = 1:N-1
    g = @(xy)(y(n) + h*f(x(n+1), xy) - xy);
    xy  = y(n);
    for i = 1:gn
        gd = (g(xy + gh) - g(xy - gh))/gh/2;
        xy = xy - g(xy)/gd;
        if abs(g(xy)) < ge
            break;
        end
    end
    y(n+1) = xy;
     
    fprintf("%d)\t%.10f\t%.10f\n", n, x(n+1), y(n+1));
end

% **************************************************^**************************************************
% *****************************# Copyright by Ali Forouzandeh Hafshejani #*****************************
% ******************************# Scientific Computing Specialist 20@20 #******************************
% **************************************************^**************************************************