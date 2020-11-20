function [v, mu] = powering_eig(A, v0, e, mi)
    v = A*v0;
    mu = v(find(abs(v) == max(abs(v)), 1));
    v = v/mu;
    for k = 2:mi
		v0 = v;
        mu0 = mu;
        v = A*v0;
        mu = v(find(abs(v) == max(abs(v)), 1));
        v = v/mu;
        if abs(mu - mu0) < e
            break
        end
    end
return

% **************************************************^**************************************************
% *****************************# Copyright by Ali Forouzandeh Hafshejani #*****************************
% ******************************# Scientific Computing Specialist 20@20 #******************************
% **************************************************^**************************************************