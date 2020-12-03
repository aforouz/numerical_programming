function [A] = func_newton_divided_difference(f, x)
	A = [];
	
    if nargin < 1 || nargin > 2
		disp('Error in input');
		return;
	elseif nargin == 1
		x = 1:length(f);
    end

    if size(f, 1)==1
        f = f';
    end
	
    n = length(f);
    A = ones(n)*NaN;
    A(:, 1) = f;
    for j = 2:n
        for i = j:n
            A(i, j) = (A(i, j-1)-A(i-1, j-1))/(x(i)-x(i-j+1));
        end
    end
return

% **************************************************^**************************************************
% *****************************# Copyright by Ali Forouzandeh Hafshejani #*****************************
% ******************************# Scientific Computing Specialist 20@20 #******************************
% **************************************************^**************************************************