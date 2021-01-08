function [L] = jacobi_eig(A, e, mi)
	L = [];
    [~, n] = size(A);
    if any(any(A ~= A'))
        return
    end
    for k = 1:mi
        D = tril(A, -1) + triu(A, 1);
        [m, p] = max(abs(D));
		[~, q] = max(m);
        p = p(q);
        a = abs(A(p,q));
        if a < e
            break
        end
        teta = atan2(-2*a, A(p,p)-A(q,q))/2;
        cos_teta = cos(teta);
        sin_teta = sin(teta);
        E = eye(n);
        E(p, p) = cos_teta;
        E(q, q) = cos_teta;
        E(q, p) = -sin_teta;
        E(p, q) = sin_teta;
        A = E'*A*E;
    end
    L = diag(A);
return

% **************************************************^**************************************************
% *****************************# Copyright by Ali Forouzandeh Hafshejani #*****************************
% ******************************# Scientific Computing Specialist 20@20 #******************************
% **************************************************^**************************************************