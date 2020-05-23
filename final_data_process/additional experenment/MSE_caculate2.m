% 6DOF estmation error
%--------the paper choose data for figure of time estimation of two method--------------%%
%----------------------%%
%-----Qiu choose and inport the datamat

%used to compare angle velocity
if ~ exist('uavestargumentKF')
load('uavest_argumentKF.mat');
end
if ~ exist('my_est_save_paper_method')
load('my_est_save_paper_method.mat');
end
if ~ exist('uavTruth_paper_method')
load('uavTruth_paper_method.mat');
end
if ~ exist('uavSensors_paper_method')
load('uavSensors_paper_method.mat');
end
if ~ exist('uavSensors_arguKF')
load('uavSensors_arguKF.mat');
end


%used to compare the time
if ~ exist('uavest_argu_0_20')
load('uavest_argumentKF_0_20.mat');   %my method results
end
if ~ exist('my_est_save_nice_time')
load('my_est_save_nice_time.mat');   %my method results
end
if ~ exist('uavEst_paper_method')
load('uavEst_paper_method.mat');   %my method results
end
LENG = length(my_est_save_paper_method.pith);

angle_er_my= my_est_save_paper_method.pith -uavTruth_paper_method.pitch_deg;
angle_er_KF= uavestargumentKF.pitch_deg -uavTruth_paper_method.pitch_deg;
pit_mse_my1 = mse_caculate(angle_er_my(40000:45000))
pit_mse_my2 = mse_caculate(angle_er_my(45000:50000))
pit_mse_KF1 = mse_caculate(angle_er_KF(40000:45000))
pit_mse_KF2 = mse_caculate(angle_er_KF(45000:50000))

angle_er_my= uavEst_paper_method.roll_deg -uavTruth_paper_method.roll_deg;
angle_er_KF= uavestargumentKF.roll_deg -uavTruth_paper_method.roll_deg;
roll_mse_my1 = mse_caculate(angle_er_my(40000:45000))
roll_mse_my2 = mse_caculate(angle_er_my(45000:50000))
roll_mse_KF1 = mse_caculate(angle_er_KF(40000:45000))
roll_mse_KF2 = mse_caculate(angle_er_KF(45000:50000))


angle_er_my= uavEst_paper_method.yaw_deg -uavTruth_paper_method.yaw_deg;
angle_er_KF= uavestargumentKF.yaw_deg -uavTruth_paper_method.yaw_deg;
Yaw_mse_my1 = mse_caculate(angle_er_my(40000:45000))
Yaw_mse_my2 = mse_caculate(angle_er_my(45000:50000))
Yaw_mse_KF1 = mse_caculate(angle_er_KF(40000:45000))
Yaw_mse_KF2 = mse_caculate(angle_er_KF(45000:50000))


angle_er_my= my_est_save_paper_method.ad_speed(:,2) -uavTruth_paper_method.v_ned_mps(:,2);
angle_er_KF= uavestargumentKF.v_ned_mps(:,2) -uavTruth_paper_method.v_ned_mps(:,2);
v_mse_my1 = mse_caculate(angle_er_my(40000:45000))
v_mse_my2 = mse_caculate(angle_er_my(45000:50000))
v_mse_KF1 = mse_caculate(angle_er_KF(40000:45000))
v_mse_KF2 = mse_caculate(angle_er_KF(45000:50000))
 

angle_er_my= my_est_save_paper_method.ad_pos(:,2) -uavTruth_paper_method.east_m;
angle_er_KF= uavestargumentKF.north_m -uavTruth_paper_method.north_m;
v_mse_my1 = mse_caculate(angle_er_my(40000:45000))
v_mse_my2 = mse_caculate(angle_er_my(45000:50000))
v_mse_KF1 = mse_caculate(angle_er_KF(40000:45000))
v_mse_KF2 = mse_caculate(angle_er_KF(45000:50000))
 


angle_er_my= my_est_save_nice_time.right_delay_time/100 -0.2;
angle_er_KF= uavest_argu_0_20.time_err -0.2;
t_mse_my1 = mse_caculate(angle_er_my(40000:45000))
t_mse_my2 = mse_caculate(angle_er_my(45000:50000))
t_mse_KF1 = mse_caculate(angle_er_KF(40000:45000))
t_mse_KF2 = mse_caculate(angle_er_KF(45000:50000))

function [out] = mse_caculate(in)
  L = length (in);
  out  = sum(in.^2)/L;
  out = sqrt(out);
end
