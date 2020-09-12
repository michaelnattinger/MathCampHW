clear; close all; clc

syms x y a1 a2 b1 b2 palpha pbeta

f1 = x == palpha *a1 + pbeta*b1;
f2 = y == palpha *a2 + pbeta*b2;
f = [f1 f2];
sols = solve(f,[palpha pbeta]);
