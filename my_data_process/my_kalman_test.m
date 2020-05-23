%记住先运行uav_state_estimation来初始化仿真数据

load('my_sensor_data.mat');%
%G
gravity_mps2 = 9.81;
%ekf参数
ekf = []
ekf.sigmas.mag3D_unitVector_meas =1* sqrt(uavSensors.sigmas.mag3D_unitVector_noise^2+(5*uavSensors.sigmas.mag3D_unitVector_bias)^2)
ekf.sigmas.accel_meas_mps2       = 1.0*sqrt(uavSensors.sigmas.accel_noise_mps2^2      +(5*uavSensors.sigmas.accel_bias_mps2)^2      )

% EKF initial bias uncertainty estimates (used to form initial "P" matrix in EKF)
ekf.sigmas.gyro_bias_rps         = 0.5*uavSensors.sigmas.gyro_bias_rps

% EKF process noise estimates (used to form "Q" matrix in EKF)
% Note: Assigning process noise values requires some engineering judgement.
%   In general, Q establishes how much we expect reality to deviate from our
%   simple model of vehicle motion.  
%   Process noise of sensor biases are near-zero (e.g. 1e-6) because we 
%   don't expect them to vary very quickly.
ekf.sigmas.quat_process_noise = .0050         % Quaternion process noise
ekf.sigmas.gyroBias_process_noise_rps = 1e-6 % Gyro bias process noise, rad/s

% Build initial state estimates
ekf.xhat = [ ...
        [1 1 1 1]...                                  %   1-4: init quaternion (NED-to-body) estimate
        [0 0 0] ...                                 %   5-7: init XYZ gyro bias estimates, rad/s
    ]';
  
ekf.P = eye(7);
     ekf.Q = diag([...
            [1 1 1 1]*ekf.sigmas.quat_process_noise ...         % quaternion process noise
            [1 1 1]*ekf.sigmas.gyroBias_process_noise_rps ...   % XYZ gyro bias process noise, rad/s
        ].^2);
    % Make sure no elements of Q diagonal are zero! Arbitrarily use a
    % minimum of (1e-3)^2.  (For example, if gyroBias was set to zero when
    % generating the sensor measurement, we still want some Q process
    % noise.)
    ekf.Q = max(ekf.Q,(1e-3)^2*eye(size(ekf.Q)));    
  ekf.R = diag([...
            [1 1 1]*ekf.sigmas.accel_meas_mps2 ...       % xyz Accelerometer noise, m/s^2
            ekf.sigmas.mag3D_unitVector_meas ... % Mag. unit vector noise
        ].^2);
    % Make sure no elements of R diagonal are zero! Arbitrarily use a
    % minimum of (1e-3)^2.
    ekf.R = max(ekf.R,(1e-3)^2*eye(size(ekf.R)));    


% for kTime=1:length(uavSensors.time_s)
for kTime=1:length(my_sensor_data(1,:))
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % Extract variables at time kTime from uavSensors structure
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
%     time_s                  = uavSensors.time_s(kTime);
%     pitot_airspeed_mps      = uavSensors.pitot_airspeed_mps(kTime);
%     gyro_wb_rps             = uavSensors.gyro_wb_rps(kTime,:)';              % 3x1 vector
%     accel_fb_mps2           = uavSensors.accel_fb_mps2(kTime,:)';            % 3x1 vector
%     mag3D_unitVector_in_body= uavSensors.mag3D_unitVector_in_body(kTime,:)'; % 3x1 vector
%     mag2D_yaw_deg           =0;
%     
%     
    new_data = my_sensor_data(:,kTime);
    pitot_airspeed_mps      = 0;
    gyro_wb_rps             = [new_data(1);new_data(2);new_data(3)]*pi/180;              % 3x1 vector
    
    accel_fb_mps2           = [-new_data(4);-new_data(5);-new_data(6)];          % 3x1 vector
    norm_acc=((accel_fb_mps2(1))^2+(accel_fb_mps2(2))^2+(accel_fb_mps2(3))^2)^0.5;
    accel_fb_mps2=accel_fb_mps2./ norm_acc.*gravity_mps2;
    mag3D_unitVector_in_body= [new_data(7);new_data(8);0] ;% 3x1 vector
    norm_mag=((mag3D_unitVector_in_body(1))^2+(mag3D_unitVector_in_body(2))^2+(mag3D_unitVector_in_body(3))^2)^0.5;
    mag3D_unitVector_in_body=mag3D_unitVector_in_body./norm_mag;
    
    mag2D_yaw_deg           =0;
    
    
    % Define the change-in-time between time steps.  If this is the first
    % time through, use the change in time between kTime=2 and kTime=1.  
    % Otherwise, use the time between steps kTime and kTime-1.
    if kTime==1
        dt_s = 0.02;
    else
        dt_s = 0.02;
    end

    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % Translational state estimation (position and velocity)
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
%     if(GPS_valid)
%         % When GPS is valid, use GPS position and velocity estimates
%         east_est_m = GPS_east_m;
%         north_est_m= GPS_north_m;
%         h_msl_est_m= GPS_h_msl_m;
%         v_ned_est_mps = GPS_v_ned_mps;
%     else
%         % When GPS isn't valid, assume constant velocity and propagate 
%         % position estimates.
%         % (Alternatively, a UAV with an AHRS might just keep the position 
%         % estimate constant between GPS measurements.)
%         north_est_m = north_est_m + dt_s*v_ned_est_mps(1);
%         east_est_m  = east_est_m  + dt_s*v_ned_est_mps(2);
%         h_msl_est_m = h_msl_est_m + dt_s*(-v_ned_est_mps(3)); % <- Note: 3rd element of v_ned is down velocity 
%     end

    % Generate a "reference" velocity vector in body coordinates.  This is
    % used in accounting for centripetal acceleration effects (see Ref 1).
    %
    % Note: We can't directly use v_ned_est_mps because we don't yet know
    % the UAV orientation (hence how to rotate NED velocity into body
    % coordinates.
    %
    % Often, the y- and z- components of the reference velocity are
    % neglected, and only the x-component (i.e. the axial component) of the
    % velocity vector is accounted for.  The axial velocity can be
    % estimated using either the pitot tube airspeed measurement or the
    % horizontal inertial velocity estimate from GPS.  We'll use the pitot.
    vb_ref_mps = [pitot_airspeed_mps; 0; 0];  
    vb_ref_mps = [-1; 0; 0]; 
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % Rotational state estimation (yaw, pitch and roll)
    % Prepare inputs to Extended Kalman Filter (EKF) routine, perform_ekf().
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    % The Extended Kalman Filter is an iterative method for providing an 
    % estimate (xhat) of a true non-linear state vector (x) based on measurements (z).
    % It is assumed that the dynamics of x and the measurement z can be
    % represented as a non-linear continuous-time model:
    %
    %    Non-Linear Continuous-Time Model
    %    --------------------------------
    %    xdot(t) = f(x(t),u(t)) + w(t),           E(w(t)*w(t)')=Q(t)
    %    z(t)    = h(x(t),u(t)) + v(t),           E(v(t)*v(t)')=R(t)
    %
    % where xdot is the time-derivative of x; f() and h() are non-linear
    % functions mapping the state vector x, and possibly other inputs
    % u, into the state derivatives (xdot) and measurement model, 
    % respectively; and w & v are Gaussian processes representing unmodeled 
    % state dynamics process noise and measurement noise, respectively.  
    % Q & R are the covariances of w and v.  In addition to estimating the
    % state vector x, the EKF maintains an error covariance matrix, P,
    % which is a representation of its uncertainty in the estimate of x.
    %
    % Note that the Extended Kalman Filter is based on a linearization of
    % the above non-linear system, and thus requires the linearized
    % dynamics and measurement matrices, F & H, as in:
    %
    %    Linearized Continuous-Time Model
    %    --------------------------------
    %    xdot(t) = F(t)*x(t) + Fu(t)*u(t) + w(t),  E(w(t)*w(t)')=Q(t)
    %    z(t)    = H(t)*x(t) + Hu(t)*u(t) + v(t),  E(v(t)*v(t)')=R(t)

    % Determine continuous time state dynamics process noise covariance, Q. 
    % (Here, Q is a diagonal 7x7 matrix)
    % The parameters used were defined above.

    % Assign functions to return dynamics model and measurement model.
    %   [xdot F]=compute_xdot_and_F(xhat,u1,u2,...)
    %     xdot: estimated state derivatives with respect to time, xdot=dx/dt
    %     F:    linearized dynamics model, where F is a matrix mapping xhat to xdot
    %     xhat: EKF state vector estimate
    %     uk:   Additional inputs necessary to compute: xdot, F, zhat, and H (k=1,2,...)
    %   [zhat H]=compute_zhat_and_H(xhat,u1,u2,...)
    %     zhat: re-creation of measurement z, based on current state estimate
    %     H:    linearized measurement model, where H is a matrix mapping xhat to zhat
    %     xhat: EKF state vector estimate
    %     uk:   Additional inputs necessary to compute: xdot, F, zhat, and H (k=1,2,...)
    ekf.compute_xdot_and_F = @compute_xdot_and_F__ahrs_ekf_quaternion;
    ekf.compute_zhat_and_H = @compute_zhat_and_H__ahrs_ekf_quaternion;
    ekf.u1 = gyro_wb_rps;                           % Additional input needed to compute xdot, F, zhat, or H
    ekf.u2 = vb_ref_mps;                            % Additional input needed to compute xdot, F, zhat, or H
    ekf.u3 = gravity_mps2;                          % Additional input needed to compute xdot, F, zhat, or H
    ekf.u4 =0; % Additional input needed to compute xdot, F, zhat, or H
   yaw_mag=atan2(mag3D_unitVector_in_body(2),mag3D_unitVector_in_body(1));
    % Assign measurement, z, and sampled measurement uncertainty matrix, R(k).
    ekf.z = [...
            accel_fb_mps2; ...                          % Accelerometer specific force measurement, m/s^2 [3x1]
            yaw_mag; ...               % Magnetometer unit vector [3x1]
        ];
%    ekf.z(6)=0;
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % Perform EKF
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    [ekf.xhat ekf.P] = my_perform_ekf( ...
                ekf.compute_xdot_and_F, ... % Handle to function which returns xdot (nx1 state derivatives) and F (nxn linearized dynamics model)
                ekf.xhat, ...               % Current full state estimate (nx1)
                ekf.P, ...                  % Current state covariance matrix (nxn)
                ekf.Q, ...                  % Continuous time state process noise matrix (nxn)
                ekf.compute_zhat_and_H, ... % Handle to function which returns zhat (mx1 non-linear meas estimate) and H (mxm linearized meas model)
                ekf.z, ...                  % Current measurement vector (mx1)
                ekf.R, ...                  % Sampled measurement error covariance matrix (mxm)
                dt_s, ...                   % Time step interval, seconds: t(k+1) = t(k) + dt
                ekf.u1, ...                 % Additional input for compute_xdot_and_F() and compute_zhat_and_H().
                ekf.u2, ...                 % Additional input for compute_xdot_and_F() and compute_zhat_and_H().
                ekf.u3, ...                 % Additional input for compute_xdot_and_F() and compute_zhat_and_H().
                ekf.u4 ...                  % Additional input for compute_xdot_and_F() and compute_zhat_and_H().
                );

    % Re-scale quaternion
    %   By definition the 4-element quaternion must have unity magnitude.  So, 
    %   after the EKF update we need to make sure it still does.
    %   Force: [q0;q1;q2;q3] = [q0;q1;q2;q3]/sqrt(q0^2+q1^2+q2^2+q3^2)
    ekf.xhat(1:4)=ekf.xhat(1:4)/norm(ekf.xhat(1:4));

    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % Compile uavEst, structure of state estimates
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    % Convert quaternion to yaw, pitch, and roll estimates, as described in
    % Section G of rotation_examples.m.
    %   1) Convert quaternion [q0;q1;q2;q3] into the Direction Cosine Matrix
    %      from North-East-Down (NED) coordinate frame to the body coordinate
    %      frame: C_ned2b (DCM uses Z-Y-X rotation order)
    %   2) Extract roll, pitch, and yaw estimates from DCM:
    %                    [ cos(pitch)cos(yaw)   cos(pitch)sin(yaw)       -sin(pitch)    ]
    %          C_ned2b = [        . . .              . . .          sin(roll)cos(pitch) ]
    %                    [        . . .              . . .          cos(roll)cos(pitch) ]
    %                    Note: the lower left of C_ned2b is not relevant to
    %                    the nominal euler angle extraction.
    q0=ekf.xhat(1); % Quaternion scalar
    q1=ekf.xhat(2); % \
    q2=ekf.xhat(3); %  ) Quaternion vector
    q3=ekf.xhat(4); % /
    C_ned2b  = [ 1-2*(q2^2+q3^2)    2*(q1*q2+q3*q0)     2*(q1*q3-q2*q0); ...
                 2*(q1*q2-q3*q0)    1-2*(q1^2+q3^2)     2*(q2*q3+q1*q0); ...
                 2*(q1*q3+q2*q0)    2*(q2*q3-q1*q0)     1-2*(q1^2+q2^2)];
    roll_est_deg  = -180/pi * atan2(C_ned2b(2,3),C_ned2b(3,3));
    pitch_est_deg =- 180/pi * asin( -C_ned2b(1,3) );
    yaw_est_deg   = 180/pi * atan2(C_ned2b(1,2),C_ned2b(1,1)); % -180 <= yaw <= 180
    if abs(C_ned2b(1,3)) > 1 - 1e-8
        % Pitch=+/-90deg case.  Underdetermined, so assume roll is zero,
        % and solve for pitch and yaw as follows:
        roll_est_deg   = 0;
        pitch_est_deg  = 180/pi*atan2( -C_ned2b(1,3), C_ned2b(3,3) );
        yaw_est_deg    = 180/pi*atan2( -C_ned2b(2,1), C_ned2b(2,2) );
    end

    % Append current state estimates to uavEst structure components
    if kTime==1        
        % Allocate memory for vectors and arrays
        uavEst=[];
        uavEst.time_s    = 0*uavTruth.time_s;
        uavEst.roll_deg  = 0*uavTruth.time_s;
        uavEst.pitch_deg = 0*uavTruth.time_s;
        uavEst.yaw_deg   = 0*uavTruth.time_s;
%         uavEst.north_m   = 0*uavTruth.time_s;
%         uavEst.east_m    = 0*uavTruth.time_s;
%         uavEst.h_msl_m   = 0*uavTruth.time_s;
%         uavEst.v_ned_mps = 0*uavTruth.time_s*[1 1 1];
    end
    uavEst.time_s(kTime,:)    = uavSensors.time_s(kTime);
    uavEst.roll_deg(kTime,:)  = roll_est_deg;       % \
    uavEst.pitch_deg(kTime,:) = pitch_est_deg;      %  ) Euler angles (deg) derived from xhat states 1-4 (quaternion)
    uavEst.yaw_deg(kTime,:)   = yaw_est_deg;        % /
%     uavEst.north_m(kTime,:)   = north_est_m;        % North position estimate, m (from propagated measurement)
%     uavEst.east_m(kTime,:)    = east_est_m;         % East position estimate, m (from propagated measurement)
%     uavEst.h_msl_m(kTime,:)   = h_msl_est_m;        % Altitude estimate, above MeanSeaLevel, m (from propagated measurement)
%     uavEst.v_ned_mps(kTime,:) = v_ned_est_mps;      % NED Velocity estimate, m/s (from propagated measurement)

    % Save a state vector (called xhat) consisting of the estimated EKF
    % states (including biases).
    % Also save the corresponding covariance diagonals (P).
    if kTime==1
        % Pass state indices from ekf to uavEst
%         uavEst.states = ekf.states;
        
        % Allocate memory for arrays
        uavEst.xhat = zeros(length(uavTruth.time_s),length(ekf.xhat));
        uavEst.P    = zeros(length(uavTruth.time_s),length(ekf.xhat));
    end
    uavEst.xhat(kTime,:) = ekf.xhat';
    uavEst.P(kTime,:) = diag(ekf.P);
    
    % Note progress with dots
    if mod(kTime,ceil(length(uavTruth.time_s)/40))==0
        fprintf('.');
    end
       
end % end kTime loop
fprintf('\n')
figure(6);
hold off;
plot(uavEst.roll_deg,'r');
hold on;
plot(-my_sensor_data(10,:),'b');
grid on;
figure(7);
hold off;
plot(uavEst.pitch_deg,'r');

hold on;
plot(my_sensor_data(11,:),'b');
grid on;

 
figure(8);
hold off;
plot(uavEst.yaw_deg,'r');
hold on;
plot(-my_sensor_data(12,:),'b');
grid on;
% Clean up variables
clear time_s kTime dt_s GPS_east_m GPS_north_m GPS_h_msl_m GPS_v_ned_mps GPS_valid baro_h_msl_m pitot_airspeed_mps gyro_wb_rps accel_fb_mps2 gravity_mps2 mag3D_unitVector_in_body mag2D_yaw_deg
clear q0 q1 q2 q3 C_ned2b roll_est_deg pitch_est_deg yaw_est_deg 
clear east_est_m north_est_m h_msl_est_m v_ned_est_mps vb_ref_mps




 