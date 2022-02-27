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

% Forward
for j = 1:n-1
	% Pivot
	seq = j:n;
	chS = seq(S(j:end, j) ~= 0);
	if isempty(chS)
		error('Wrong!');
	end
	max_ind = chS(1);

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