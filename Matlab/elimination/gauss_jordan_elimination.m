% Gauss-Jordan Elimination method with pivotings:
% 'P' = Partia,
% 'R' = RationalParti,
% 'C' = Complete,
% 'N' = Normal.
% defaul method is normal pivoting

function [S, x] = gauss_jordan_elimination(A, pivoting_method)
    S = A;
    x=[];
    my_nar = uint8(nargin-1);
    [n, ~] = size(S);
    if my_nar 
        switch pivoting_method
            case 'R'
                rsS = max(abs(S(1:end, 1:n)),[],2);
            case 'C'
                csS = 1:n;
        end
    end
    % Forward
    for j = 1:n-1
        seq = j:n;
        % Pivot
        if my_nar
            switch pivoting_method
                case 'P'
                    chS = seq(abs(S(j:end, j)) == max(abs(S(j:end, j))));
                case 'R'
                    T = abs(S(j:end, j))./rsS(j:end);
                    chS = seq(T == max(T));
                case 'C'
                    mS = max(abs(S(j:end,j:n)));
                    chmS = seq(mS == max(mS));
                    
                    tmp = S(:, chmS(1));
                    S(:, chmS(1)) = S(:, j);
                    S(:, j) = tmp;
                    
                    tmp = csS(chmS(1));
                    csS(chmS(1)) = csS(j);
                    csS(j) = tmp;
                    
                    chS = seq(abs(S(j:end, j)) == max(abs(S(j:end, j))));
                otherwise
                    chS = seq(S(j:end,j) ~= 0);
					if isempty(chS)
						disp('Wrong!');
						S = A;
						return;
					end
            end
        else
            chS = seq(S(j:end, j) ~= 0);
			if isempty(chS)
				disp('Wrong!');
				S = A;
				return;
			end
        end

        max_ind = chS(1);
        % Check
        if S(max_ind, j) == 0
            disp('Wrong!');
            S = A;
            return;
        end
        % Swap
        if max_ind ~= j
            tmp = S(max_ind, j:end);
            S(max_ind, j:end) = S(j, j:end);
            S(j, j:end) = tmp;
            
            if my_nar && pivoting_method == 'R'
                tmp = rsS(max_ind);
                rsS(max_ind) = rsS(j);
                rsS(j) = tmp;
            end
        end
        % Calculate
        S(j+1:end, j+1:end) = S(j+1:end, j+1:end) - S(j+1:end, j)/S(j,j)*S(j, j+1:end);
        S(j+1:end, j) = 0;
    end
    % Check
    if S(n, n) == 0
        disp('Wrong!');
        S = A;
        return;
    end
    % Backward
    for j = n:-1:2
        % Calculate
        S(1:j-1, n+1:end) = S(1:j-1, n+1:end) - S(1:j-1, j)/S(j, j).*S(j, n+1:end);
        S(1:j-1, j) = 0;
    end
    
    if my_nar && pivoting_method == 'C'
        tmpS = S;
        [~,ind] = sort(csS);
        for i = 1:n
            S(i, i) = tmpS(ind(i), ind(i));
            S(i, n+1:end) = tmpS(ind(i), n+1:end);
        end
    end
    x = S(:, n+1:end)./diag(S);
return

% **************************************************^**************************************************
% *****************************# Copyright by Ali Forouzandeh Hafshejani #*****************************
% ******************************# Scientific Computing Specialist 20@20 #******************************
% **************************************************^**************************************************