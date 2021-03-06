function [ V ] = create_input_EFIE(k,theta,Ezo,r_s)
%create_input Summary of this function goes here
%   Detailed explanation goes here
% K = [k*cos(theta) k*sin(theta)];
m_s = [(.5*((r_s(:,1)-r_s(:,2)))+r_s(:,2)) (.5*((r_s(:,3)-r_s(:,1)))+r_s(:,1))];
P_in = m_s(:,2)-m_s(:,1);
P_in = [P_in(1) P_in(2) 0];
% Ezo = [ 0 1 0]*Ezo;
% V = (P_in*Ezo')*exp(-1j*K*r_s(:,1));
kv = [k; 0; 0];
r_s = [r_s(1);r_s(2);0];
V = P_in*[0; 1; 0]*exp(-1j*kv'*r_s);
end

