function [ Z ] = create_Z_notes_EFIE(k0,eta0,To,r_s,r_o)
%create_Z Summary of this function goes here
%   Detailed explanation goes here
% k propagation constant
% Ts tagential vector of the source
% rs source coordinate
% ro observer coordinate
% Q points for quadrature rule
% Q point Quadrature rule (eg: 1-point Quadrature)
% find the distance between source and observer

% midpoints
m_o = [(.5*((r_o(:,1)-r_o(:,2)))+r_o(:,2)) (.5*((r_o(:,3)-r_o(:,1)))+r_o(:,1))];
m_s = [(.5*((r_s(:,1)-r_s(:,2)))+r_s(:,2)) (.5*((r_s(:,3)-r_s(:,1)))+r_s(:,1))];
% Distances
P_a = r_o(:,1)-r_s(:,1);
P_b = m_s(:,2)-m_o(:,1);
P_c = m_s(:,1)-m_o(:,1);
P_d = m_s(:,2)-m_o(:,2);
P_e = m_s(:,1)-m_o(:,2);
distance = [P_a P_b P_c P_d P_e]; 
L = sqrt((r_o(1,2)-r_o(1,1))^2 + (r_o(2,2)-r_o(2,1))^2);

% Term A
R_a = sqrt(P_a'*P_a);
A = (k0*eta0*L/4)*((m_s(:,2)-m_s(:,1))'*To)*besselh(0,2,k0*R_a);
%Term B
R_b = sqrt(P_b'*P_b);
B = (eta0/4/k0)*besselh(0,2,k0*R_b);
%Term C
R_c = sqrt(P_c'*P_c);
C = (eta0/4/k0)*besselh(0,2,k0*R_c);
%Term D
R_d = sqrt(P_d'*P_d);
D = (eta0/4/k0)*besselh(0,2,k0*R_d);
%Term E
R_e = sqrt(P_e'*P_e);
E = (eta0/4/k0)*besselh(0,2,k0*R_e);
Z = A + B - C -D + E;




















% Ps = testpts(rs(1),rs(2),Ss,Qs);
% Po = testpts(ro(1),ro(2),So,Qo);
% b = zeros(Qs,Qo);
% for i = 1:Qs
%     for j = 1:Qo
%         P = Po(:,j)-Ps(:,i);
%         Pmag = sqrt(P'*P);
%         Punit = zeros(1,3);
%         Punit(1:2) = P/Pmag;
%         T = zeros(1,3);
%         T(1:2) = Ts;
%         T(3) = 0;
% % new line of code for notes        
%         angle = atan2(Ts(2),Ts(1));
% %         z_comp = cross(T,Punit);
%         z_comp = sin(angle)*Punit(1) - cos(angle)*Punit(2);
%         if flag %k*Pmag <= .05
%             b(i,j) = (besselh(0,2,k*Pmag))*z_comp; %- 1j*2/pi/(k*Pmag)*z_comp);%*sqrt(So(1)^2+So(2)^2);
% %               b(i,j) = 1j*2/pi/(k*Pmag);
%         else
%             b(i,j) = (besselh(0,2,k*Pmag)*z_comp);%*sqrt(So(1)^2+So(2)^2);
%         end
%     end
% end
% 
% if flag
%     Z = ts*((b*wo') + 1j*2/pi*log(k*Pmag)*z_comp); %+ add the analytic solution for singularity
% else
%     Z = ts*((b*wo')*sqrt(So(1)^2+So(2)^2));
% end
% % V = (w*b')*w';
end

