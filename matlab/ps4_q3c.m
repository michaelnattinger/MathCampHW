clear; close all; clc
%%% We need to find [a b]' such that [[1 -4]' [-2 7]'][a b]' = [3 -4]
% m = [[1 -4]' [-2 7]'];
% y = [3 -4]';
% b = m\y;
% disp(['Soln for part c is: ' num2str(b')]) This part is wrong

% part b
p = [[1 -4]' [-2 7]'];
W = [[1 2]' [-1 3]'];
V = inv(p) * W*p;
disp('Soln for part b is: ')
disp(num2str(V))
disp('Soln for part c is: ')
disp(num2str(V*[1;-2]))

% checks
% p*eye(2)
% V*[1;-2]
% W*[1;-2]
