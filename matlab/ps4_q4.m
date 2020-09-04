clear; close all; clc
% VAR(1) model (no constant) x_n = Ax_(n-1)
A = [1 4; 2 -1];
x0 = [1 1]';

%Step one: Calculate eigenvalues of A, and corresponding eigenvectors
%Step two: Let D=diag([eigenvalues]) and P =[eigenvectors];
[P,D] = eig(A);
%Step three: Calculate Pinv and P D.^t Pinv
Pinv = inv(P);
disp('Solution is: A^t = P D.^t Pinv where: ')
P
D
Pinv

%check
T = 100;
t = 1:T;
X = NaN(2,T);
for tt = t
    if tt==1
        X(:,1) =  A*x0;
    else
        X(:,tt) = A*X(:,tt-1);
    end
end

%Check
Xcheck = NaN(2,T);
for tt = t
    Xcheck(:,tt) = P*D.^(tt)*Pinv * x0;
end

figure
for i=1:2
subplot(2,1,i)
plot(t,X(i,:),'k-')
hold on
plot(t,Xcheck(i,:),'r-.')
hold off
title('Check: iter vs eig decomp')
end
legend('Correct value','Eig method')