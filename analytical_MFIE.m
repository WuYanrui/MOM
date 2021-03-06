function [ J, E ] = analytical_MFIE(n,k0,r)
%% Analytical solution from Text
constants
%% current on PEC cylinder
ka = k0*r;
phi = 0:2*pi/n:2*pi; % number of terms
J = 1j/(pi*ka*eta0)*ones(1,length(phi));
E = 4/k0*ones(1,length(phi));
k = [1 2];

for t = 1:length(phi)
    angle = phi(t);
    sum = 0;
    sum_c = 0;
    for i = 0:n-1
          if i == 0
              sum = sum + (1j)^(-i)*2*k(1)*cos(i*angle)/(hankel_prime(i,ka));
              sum_c = sum_c + k(1)*bessel_prime(i,ka)*cos(i*angle)/hankel_prime(i,ka);
          else
              sum = sum + (1j)^(-i)*2*k(2)*cos(i*angle)/(hankel_prime(i,ka));
              sum_c = sum_c + k(2)*bessel_prime(i,ka)*cos(i*angle)/hankel_prime(i,ka);
          end
    end
    J(t) = J(t)*sum;
    E(t) = E(t)*abs(sum_c)^2;
end
J = J(1:end-1);
E = E(1:end-1);
% plot(phi*180/pi,abs(J))
% xlim([phi(1)*180/pi phi(end)*180/pi])
% %% Ratio of Scattered field to incident field
% rho = 1;
% coeff = sqrt(2/pi/k0/rho);
% sigma = zeros(1,length(phi));
% for t = 1:length(phi)
%     angle = phi(t);
%     sum = 0;
%     for i = -n:n
%         sum = sum + besselj(i,ka)*exp(1j*i*angle)/besselh(i,2,ka);
%     end
%     sigma(t) = abs(sum)*coeff;
% end
% polar(phi,sigma)
end