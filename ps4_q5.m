clear; close all; clc
% AR(n) model (no constant) x_t = a_(1)x_(n-1)+ ... + a_(n)x_(t-n)
% X_t = [x_t ... x_(t - n+1)];
% X_t = A X_(t-1) -> [x_t x_t-1 ... x_t-n+1]' = A[x_t-1 ... x_t-m]'
% -> x_t = A_1 [x_t-1 ... x_t-m] -> first row of A is [a_1 ... a_n]
% -> x_t-1 = A_2 [x_t-1 ... x_t-m] -> second row of A is [1 0 ... 0 ]
% -> x_t-n+1 = A_n [x_t-1 ... x_t-m] -> n row of A is [0 ... 0 1 0]
% So, A = [a_1 a_2 ... a_n; 1 0 ... 0 ; ... ; 0 0 .. 1 0 ]
% lambda are eigenvalues of A collected into a vector
% x_t = c lambda^t
% x_0 = c lambda^0
% x_-1 = c lambda^(-1)
% x_-2 = c lambda^(-2)

a1 = 2; a2 = 1; a3 = -2;
x0 = 2; xm1 = 2; xm2 = 1;

T = 10; t = 1:T;
X = NaN(T,1);
for tt=t
    if tt ==3
        X(tt,1) = a1*X(tt-1,1) + a2*X(tt-2,1) + a3*x0;
    elseif tt ==2
        X(tt,1) = a1*X(tt-1,1) + a2*x0 + a3*xm1;
    elseif tt==1
        X(tt,1) = a1*x0 + a2*xm1 + a3*xm2;
    else
        X(tt,1) = a1*X(tt-1,1) + a2*X(tt-2,1) + a3*X(tt-3,1);
    end
end

A = [a1 a2 a3; 1 0 0; 0 1 0];
%D = eig(A)';
D = [2 1 -1]; % ordering of eigenvalues in my writeup


Dm = [D.^0; D.^(-1); D.^(-2)];
X0 = [x0; xm1; xm2];
C = inv(Dm)*X0;

Xcheck =NaN(T,1);
for tt=t
   Xcheck(tt,1) = (D.^tt)*C; 
end

figure
plot(Xcheck)
hold on
plot(X)
hold off
title('Check: iter vs eig decomp')
legend('Correct value','Eig method')
set(gcf,'Color',[1 1 1])

return
C = Dm\[x0; xm1; xm2];

Xcheck =NaN(T,1);
for tt = t
    Xcheck(tt,1) = D.^(tt)*C;
end

figure
plot(t,X(:),'k-')
hold on
plot(t,Xcheck(:),'r-.')
hold off
title('Check: iter vs eig decomp')
legend('Correct value','Eig method')