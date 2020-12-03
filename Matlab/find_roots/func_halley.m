function [c] = func_halley(a, f, df, ddf, d, N)
	c = [];
	
	if nargin < 4 || nargin > 6
		disp('Error in input');
		return;
	elseif nargin == 5
		N = 100;
	elseif nargin == 4
		N = 100;
		d = 4;
	end
	
	err = 0.5 * 10^-d;
	fprintf("I\ta\t\t\t\tf(a)\t\t\tdf(a)\t\t\tddf(a)\t\t\tc\t\t\t\tf(c)\n");
	for i = 1:N
		af = f(a);
		adf = df(a);
		addf = ddf(a);
		c = a - 2*af*adf/(2*adf^2 - af*addf);
		cf = f(c);
		fprintf("%d)\t%.10f\t%.10f\t%.10f\t%.10f\t%.10f\t%.10f\n", i, a, af, adf, addf, c, cf);
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