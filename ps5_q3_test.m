clear; close all; clc
v = [1 8]'; % our vector (in standard basis)
bv = [9 4]'; % the nonnormal basis (pre-norm)
bv = bv./norm(bv);
b = [bv [ bv(2) -1*bv(1)]'];
% for i=1:2
%     b = [bv bv^(-1)];
%     %b(:,i) = b(:,i)./norm(b(:,i));
% end
v2 = b\v;
disp(['norm(v1) = ' num2str(norm(v))])
disp(['norm(v2) = ' num2str(norm(v2))])

% Orthonormal basis checks
ch1 = b*b' % both I<=>orthonormal
ch2 = b'*b