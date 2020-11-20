function [A] = givens_eig(A)
    [~, n] = size(A);
    if any(any(A ~= A'))
        return
    end
    for r = 1:n-2
		for p = r+2:n
			q = r+1;
			tan_teta = A(p,r)/A(q,r);
			cos_teta = 1/sqrt(1 + tan_teta^2);
			sin_teta = cos_teta*tan_teta;    
			E = eye(n);
			E(p, p) = cos_teta;
			E(q, q) = cos_teta;
			E(q, p) = -sin_teta;
			E(p, q) = sin_teta;
			A = E'*A*E;
		end
    end
return

% **************************************************^**************************************************
% *****************************# Copyright by Ali Forouzandeh Hafshejani #*****************************
% ******************************# Scientific Computing Specialist 20@20 #******************************
% **************************************************^**************************************************