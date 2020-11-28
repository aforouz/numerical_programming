function [c] = func_bisection(a, b, f, d, N)
	if nargin < 3 || nargin > 5
		disp('Error in input');
		return;
	elseif nargin == 4
		N = 100;
	elseif nargin == 3
		N = 100;
		d = 4;
	end
	
	c = [];
	err = 0.5 * 10^-d;
	fprintf("I\ta\t\t\t\tf(a)\t\t\tb\t\t\t\tf(b)\t\t\tc\t\t\t\tf(c)\n");
	for i = 1:N
		af = f(a);
		bf = f(b);
		c = (a+b)/2;
		cf = f(c);
		fprintf("%d)\t%.10f\t%.10f\t%.10f\t%.10f\t%.10f\t%.10f\n", i, a, af, b, bf, c, cf);
		if abs(cf) < err
			break;
		elseif af*cf > 0
			a = c;
		else
			b = c;
		end
	end
return

% **************************************************^**************************************************
% *****************************# Copyright by Ali Forouzandeh Hafshejani #*****************************
% ******************************# Scientific Computing Specialist 20@20 #******************************
% **************************************************^**************************************************