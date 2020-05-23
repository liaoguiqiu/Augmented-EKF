%%磁力计的观察方程Jacobi
syms q0 q1 q2 q3
C00=(1-2*(q2*q2+q3*q3))
C01=-2*(q1*q2+q3*q0);
DD=(C00^2+C01^2)^0.5
my=C01/DD
mx=C00/DD
yaw=atan2(1,q0)
diff(yaw,q0)
 D1=( 1-2*(q2^2+q3^2))^2;
 diff(D1,q2)
 
 
  C_mag2ned = [ cos(-pi/180*45)  sin(-pi/180*45)   0; ...
                 -sin(-pi/180*45)  cos(-pi/180*45)   0; ...
                 0                                                    0                                                    1];

             
             north=[1;0;0]
             C_mag2ned*north
             
%  
% diff_my_q0 = diff(my,'q0')
% diff_my_q1 = diff(my,q1)
% diff_my_q2 = diff(my,q2)
% diff_my_q3 = diff(my,q3)
% 
% 
% diff_mx_q0 = diff(mx,q0)
% diff_mx_q1 = diff(mx,q1)
% diff_mx_q2 = diff(mx,q2)
% diff_mx_q3 = diff(mx,q3)
% diff(mx,q0)
% diff(mx,q1)
% diff(mx,q2)
% diff(mx,q3)
% diff(my,q0)
% diff(my,q1)
% diff(my,q2)
% diff(my,q3)

