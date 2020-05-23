% function [xhat_new P_new] = my_perform_ekf(compute_xdot_and_F,xhat_k,P_k,Q_t,compute_zhat_and_H,z_k,R_k,dt,varargin)
 function [xhat_new P_new] = my_perform_ekf(compute_xdot_and_F,xhat_k,P_k,Q_t,compute_zhat_and_H,z_k,R_k,dt,u1,u2,u3,u4)
 

 
%Ô¤²â¾ØÕýF
q0=xhat_k(1);    % Attitude quaternion
q1=xhat_k(2);  % 
q2=xhat_k(3);    % 
q3=xhat_k(4);   % 
bwx=xhat_k(5);  % Gyro biases, rad/s
bwy=xhat_k(6);   % 
bwz=xhat_k(7);   % 
% Angular rate measurement from gyros
wx=  u1(1); % rad/s
wy=  u1(2);
wz= u1(3);
C_bodyrate2qdot  = .5*[-q1  -q2  -q3; ...
                        q0  -q3   q2; ...
                        q3   q0  -q1; ...
                       -q2   q1   q0];
                   % Akin to Equation 20 in Reference 1.
xdot = [ ...
        C_bodyrate2qdot*([wx;wy;wz]-[bwx;bwy;bwz]); ...    % Derivative of [q0; q1; q2; q3]
        [0;0;0]; ...                                       % Derivative of [bwx; bwy; bwz]
       ];
 F = [ ...
    [            0, bwx/2 - wx/2, bwy/2 - wy/2, bwz/2 - wz/2,  q1/2,  q2/2,  q3/2]
    [ wx/2 - bwx/2,            0, wz/2 - bwz/2, bwy/2 - wy/2, -q0/2,  q3/2, -q2/2]
    [ wy/2 - bwy/2, bwz/2 - wz/2,            0, wx/2 - bwx/2, -q3/2, -q0/2,  q1/2]
    [ wz/2 - bwz/2, wy/2 - bwy/2, bwx/2 - wx/2,            0,  q2/2, -q1/2, -q0/2]
    [            0,            0,            0,            0,     0,     0,     0]
    [            0,            0,            0,            0,     0,     0,     0]
    [            0,            0,            0,            0,     0,     0,     0]
    ];       
   
nStates=length(xhat_k);
AA = [-F Q_t; zeros(nStates,nStates) F']*dt;
BB = expm(AA); % <- Matrix exponential!
PHI_k = BB(nStates+1:2*nStates,nStates+1:2*nStates)';
Q_k = PHI_k*BB(1:nStates,nStates+1:2*nStates);

%¸½¼Ó²âÊÔ(»¯¼ò°æ±¾)
%  PHI_k= F*dt + eye(7);
%  Q_k=Q_t;

% Q_k=Q_t;
% Predict state estimate xhat forward dt seconds.
%
% We use Euler integration on the non-linear state derivatives, 
% xdot(t)=f(x(t),u(t)), to propagate xhat dt seconds from time k to time
% k+1:
%    xhat(k+1) = xhat(k) + xdot(t)*dt.
% We alternatively could have used:
%    xhat(k+1) = PHI*xhat(k) + PHIu*u(k).
% Doing so, however, would have introduced some linearization error and
% required us to compute PHIu.
xhat_k = xhat_k + xdot*dt;
 
%    P(k+1) = PHI(k)*P(k)*PHI(k)' + Q(k)
P_k = PHI_k*P_k*PHI_k' + Q_k;

% Perform measurmement update
if ~isempty(z_k)
    
    % zhat: re-creation of measurement z, based on current state estimate
    %          zhat(k) = zhat(t) = h(xhat,u) (mx1 vector)
    % H:    linearized measurement matrix (Jacobian of h, with respect to the EKF states)
    %          H = d(zhat)/dx = d( h(xhat,u) )/dx (mxn matrix)
    %
    % Note: varargin{:} consists of the any additional inputs (u1, u2, ...) 
    % necessary to compute zhat and H.
%     [zhat H] = compute_zhat_and_H(xhat_k,u1,u2,u3,u4);
    Vx=u2(1); % m/s
    Vy=u2(2); % 
    Vz=u2(3); % 
C_ned2b  = [ 1-2*(q2^2+q3^2)    2*(q1*q2+q3*q0)     2*(q1*q3-q2*q0); ...
             2*(q1*q2-q3*q0)    1-2*(q1^2+q3^2)     2*(q2*q3+q1*q0); ...
             2*(q1*q3+q2*q0)    2*(q2*q3-q1*q0)     1-2*(q1^2+q2^2)];
C_mag2ned = [  cos(-u4*pi/180)   sin(-u4*pi/180)   0; ...
              -sin(-u4*pi/180)   cos(-u4*pi/180)   0; ...
                       0                                  0                          1];
mag3D_unitVector_in_body = C_ned2b*C_mag2ned*[1;0;0];
accel_fb_mps2 = cross([wx-bwx; wy-bwy; wz-bwz], [Vx;Vy;Vz]) - C_ned2b*[0;0;u3];
fx = accel_fb_mps2(1);
fy = accel_fb_mps2(2);
fz = accel_fb_mps2(3);
yaw_mag_vect=atan2(C_ned2b(1,2),C_ned2b(1,1)); % -180 <= yaw <= 180
zhat = [ ...
        [fx; fy; fz]; ...             % [Accel. specific force measurement]
        -yaw_mag_vect;     % [3D magnetometer unit vector]
       ];
z_k(4)=-z_k(4);
%    H = [ ...
%     [                                                                     2*u3*q2,                                                                  (-2)*u3*q3,                                                                     2*u3*q0,                                                                    (-2)*u3*q1,   0, -Vz,  Vy]
%     [                                                                  (-2)*u3*q1,                                                                  (-2)*u3*q0,                                                                  (-2)*u3*q3,                                                                    (-2)*u3*q2,  Vz,   0, -Vx]
%     [                                                                               0,                                                                     4*u3*q1,                                                                     4*u3*q2,                                                                                 0, -Vy,  Vx,   0]
%     [                                          2*q3*sin((pi*u4)/180),                                          2*q2*sin((pi*u4)/180), 2*q1*sin((pi*u4)/180) - 4*q2*cos((pi*u4)/180),   2*q0*sin((pi*u4)/180) - 4*q3*cos((pi*u4)/180),   0,   0,   0]
%     [                                       (-2)*q3*cos((pi*u4)/180), 2*q2*cos((pi*u4)/180) - 4*q1*sin((pi*u4)/180),                                          2*q1*cos((pi*u4)/180), - 2*q0*cos((pi*u4)/180) - 4*q3*sin((pi*u4)/180),   0,   0,   0]
%     [ 2*q2*cos((pi*u4)/180) - 2*q1*sin((pi*u4)/180), 2*q3*cos((pi*u4)/180) - 2*q0*sin((pi*u4)/180), 2*q0*cos((pi*u4)/180) + 2*q3*sin((pi*u4)/180),   2*q1*cos((pi*u4)/180) + 2*q2*sin((pi*u4)/180),   0,   0,   0]
%     ];
%  D1= 1-2*(q2^2+q3^2);
 D1=q0^2-q1^2+q2^2-q3^2;
 D2=q1*q2-q3*q0;
 DD=D1^2+4*D2^2;
    
 diff_mx_q0=0;
 diff_mx_q1=0;
 diff_mx_q2=0;
 diff_mx_q3=0;
 
 if(DD~=0)
     
 diff_mx_q0=-(2*q3*D1+4*q0*D2)/DD;
 diff_mx_q1=-(-2*q2*D1-4*q1*D2)/DD;
 diff_mx_q2=-(-2*q1*D1+4*q2*D2)/DD;
 diff_mx_q3=-(2*q0*D1-4*q3*D2)/DD;
 
 end
  H = [ ...
    [    2*u3*q2,      (-2)*u3*q3,     2*u3*q0,        (-2)*u3*q1,   0, -Vz,  Vy]
    [   (-2)*u3*q1,   (-2)*u3*q0,   (-2)*u3*q3,      (-2)*u3*q2,  Vz,   0, -Vx]
    [  -2*u3*q0, 2*u3*q1,   2*u3*q2,       2*u3*q3, -Vy,  Vx,   0]
    [      diff_mx_q0,      diff_mx_q1, diff_mx_q2,  diff_mx_q3,   0,   0,   0]
    
    ];
    % K: Kalman gain matrix
    %  K = P_k*H'*inv(H*P_k*H'+R_k);
    %
    % Note: in Matlab, inv() can be very slow and inaccurate, so we'll use
    % the forward-slash ("/", see "help mrdivide") instead.  
    % See Reference 4 for a potentially more efficient Cholesky 
    % Factorization method for computing K, xhat_k & P_k.
    K = (P_k*H')/(H*P_k*H'+R_k);
    
    % Update of state estimates using measurement residual (z-zhat).
    %
    % Effectively, K provides a means weighting how much the measurement
    % should affect the state estimate, xhat.  Thus, if the measurement 
    % uncertainty (R_k) is "large" compared with the state uncertainty (P_k)
    % then gain matrix K will be "small", meaning that the new measurement 
    % will have little effect on the state estimate.
    % In contrast, if the measurement uncertainty is small, then K will
    % be large meaning we have high confidence in the measurement (z_k) and
    % will weight it more than the predicted state estimate.
    xhat_k = xhat_k + K*(z_k-zhat);       
    
    % Update of state covariance matrix
    %
    % Effectively, this update reduces the state uncertainties due to 
    % information gained in the measurement.
    %   P(k+1) = (I - K*H)*P(k+1)   (Note: I is the identity matrix)
    %          = P(k+1) - K*H*P(k+1)
    P_k = (eye(length(xhat_k))-K*H)*P_k;  
    
end

% Assign output values.
% These should be inputted back into perform_ekf at the subsequent time 
% step.
xhat_new=xhat_k; % xhat(k+1)
P_new   =P_k;    % P(k+1)
