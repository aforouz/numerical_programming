% Start
clc;
clear;

% Input
A = randn(5);
b = randn(5, 1);

% Init
S = [A, b];
x=[];
[n, ~] = size(S);
csS = 1:n;

% Forward
for j = 1:n-1
	% Pivot
	seq = j:n;
	mS = max(abs(S(j:end,j:n)));
	chmS = seq(mS == max(mS));
	
	tmp = S(:, chmS(1));
	S(:, chmS(1)) = S(:, j);
	S(:, j) = tmp;
	
	tmp = csS(chmS(1));
	csS(chmS(1)) = csS(j);
	csS(j) = tmp;
	
	chS = seq(abs(S(j:end, j)) == max(abs(S(j:end, j))));
	max_ind = chS(1);
	
	% Check
	if S(max_ind, j) == 0
		error('Wrong!');
	end
	
	% Swap
	if max_ind ~= j
		tmp = S(max_ind, j:end);
		S(max_ind, j:end) = S(j, j:end);
		S(j, j:end) = tmp;
	end
	
	% Calculate
	S(j+1:end, j+1:end) = S(j+1:end, j+1:end) - S(j+1:end, j)/S(j,j)*S(j, j+1:end);
	S(j+1:end, j) = 0;
end

% Check
if S(n, n) == 0
	error('Wrong!');
end

% Backward
for j = n:-1:2
	% Calculate
	S(1:j-1, n+1:end) = S(1:j-1, n+1:end) - S(1:j-1, j)/S(j, j).*S(j, n+1:end);
	S(1:j-1, j) = 0;
end

tmpS = S;
[~,ind] = sort(csS);
for i = 1:n
	S(i, i) = tmpS(ind(i), ind(i));
	S(i, n+1:end) = tmpS(ind(i), n+1:end);
end

% Solve
x = S(:, n+1:end)./diag(S);

% Print
fprintf('x = A\\b\n');
fprintf('%.10f\n', x);

% Exact
fprintf('\nExact:\n');
fprintf('%.10f\n', A\b);

% **************************************************^**************************************************
% *****************************# Copyright by Ali Forouzandeh Hafshejani #*****************************
% ******************************# Scientific Computing Specialist 20@22 #******************************
% **************************************************^**************************************************