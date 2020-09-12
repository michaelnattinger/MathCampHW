clear; close all; clc

A = [1 1;3 -1 ];
y0 = [1 3]';
[P,l] = eig(A);
P = [[1 1]; [1 -3];];