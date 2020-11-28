function [c] = func_fixed_point(a, f, g, d, N)
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
	fprintf("I\ta\t\t\t\tg(a)\t\t\tf(a)\n");
	for i = 1:N
		c = g(a);
		cf = f(c);
		fprintf("%d)\t%.10f\t%.10f\t%.10f\n", i, a, c, cf);
		if abs(cf) < err
			break;
		end
		a = c;
	end
return

% **************************************************^**************************************************
% *****************************# Copyright by Ali Forouzandeh Hafshejani #*****************************
% ******************************# Scientific Computing Specialist 20@20 #******************************
% **************************************************^**************************************************