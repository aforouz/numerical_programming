function [c] = func_newton_raphson(a, f, df, d, N)
	c = [];
	
	if nargin < 3 || nargin > 5
		disp('Error in input');
		return;
	elseif nargin == 4
		N = 100;
	elseif nargin == 3
		N = 100;
		d = 4;
	end
	
	err = 0.5 * 10^-d;
	fprintf("I\ta\t\t\t\tf(a)\t\t\tdf(a)\t\t\tc\t\t\t\tf(c)\n");
	for i = 1:N
		af = f(a);
		adf = df(a);
		c = a - af/adf;
		cf = f(c);
		fprintf("%d)\t%.10f\t%.10f\t%.10f\t%.10f\t%.10f\n", i, a, af, adf, c, cf);
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