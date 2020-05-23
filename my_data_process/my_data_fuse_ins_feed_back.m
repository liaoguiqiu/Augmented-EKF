   

  if(GPS_valid)
        % When GPS is valid, use GPS position and velocity estimates
        east_est_m = GPS_east_m;
        north_est_m= GPS_north_m;
        h_msl_est_m= GPS_h_msl_m;
        v_ned_est_mps = GPS_v_ned_mps;
    else
        % When GPS isn't valid, assume constant velocity and propagate 
        % position estimates.
        % (Alternatively, a UAV with an AHRS might just keep the position 
        % estimate constant between GPS measurements.)
        north_est_m = north_est_m + dt_s*v_ned_est_mps(1);
        east_est_m  = east_est_m  + dt_s*v_ned_est_mps(2);
        h_msl_est_m = h_msl_est_m + dt_s*(-v_ned_est_mps(3)); % <- Note: 3rd element of v_ned is down velocity 
  end
   yaw_rad   = pi/180*uavTruth.yaw_deg(kTime);
    pitch_rad = pi/180*uavTruth.pitch_deg(kTime);
    roll_rad  = pi/180*uavTruth.roll_deg(kTime);
    C_ned2b_real  = [cos(pitch_rad)*cos(yaw_rad)                                             cos(pitch_rad)*sin(yaw_rad)                                           -sin(pitch_rad); ...
                sin(roll_rad)*sin(pitch_rad)*cos(yaw_rad)-cos(roll_rad)*sin(yaw_rad)    sin(roll_rad)*sin(pitch_rad)*sin(yaw_rad)+cos(roll_rad)*cos(yaw_rad)   sin(roll_rad)*cos(pitch_rad); ...
                cos(roll_rad)*sin(pitch_rad)*cos(yaw_rad)+sin(roll_rad)*sin(yaw_rad)    cos(roll_rad)*sin(pitch_rad)*sin(yaw_rad)-sin(roll_rad)*cos(yaw_rad)   cos(roll_rad)*cos(pitch_rad)];

my_ahrsFeedback.Acc_real =[ uavTruth.vdot_ned_mps2(	kTime,1) ; ...
                       uavTruth.vdot_ned_mps2(	kTime,2);  ...
                       uavTruth.vdot_ned_mps2(	kTime,3) ] ;  %真实的acc
% 过去的Acc
%  my_ahrsFeedback.Acc_old_arry=[filterx.acc;...
%                               filtery.acc; ...
%                               -filter.acc ];
%     my_ahrsFeedback.Vb_real = uavTruth.v_ned_mps(kTime,:)';
%      my_ahrsFeedback.Vb_real   = C_ned2b_real* my_ahrsFeedback.Vb_real;
   %采用融合值                
       my_ahrsFeedback.Vb_real=[filterx.advanced_speed; ...
          filtery.advanced_speed; ...
          - filter.advanced_speed]  ;  
%           my_ahrsFeedback.Vb_real=[filterx.x(2); ...
%           filtery.x(2); ...
%           - filter.x(2)]  ;   
%         my_ahrsFeedback.Vb_real   = C_ned2b* my_ahrsFeedback.Vb_real;
 
 my_ahrsFeedback.Acc =   C_ned2b_est'*accel_fb_mps2+ [0;0;9.81 ];
%   my_ahrsFeedback.Acc =   C_ned2b'*accel_fb_mps2+ [0;0;9.81 ];
% if(abs(my_ahrsFeedback.Acc(1))>2||abs(my_ahrsFeedback.Acc(2))>2 ||abs(my_ahrsFeedback.Acc(3))>2 )
%     my_ahrsFeedback.Acc_err  = 1*C_ned2b*my_ahrsFeedback.Acc;
% else
%     my_ahrsFeedback.Acc_err =0;
% end
%    my_ahrsFeedback.Acc_err  =  C_ned2b_real*my_ahrsFeedback.Acc;
% 真实解算
%  if(kTime<1000)
%  my_ahrsFeedback.Acc_err =C_ned2b*my_ahrsFeedback.Acc_real;
%  else
%   my_ahrsFeedback.Acc_err  = 1*C_ned2b*my_ahrsFeedback.Acc_old_arry;
%  end
%  my_ahrsFeedback.Acc_err  = 1*C_ned2b*my_ahrsFeedback.Acc_old_arry;
%  my_ahrsFeedback.Acc_err  = 0.9*C_ned2b*my_ahrsFeedback.Acc_old_arry;
 
         my_ahrsFeedback.Acc(3)=  -   my_ahrsFeedback.Acc(3);
           my_ahrsFeedback.Acc_to_speed =my_ahrsFeedback.Acc_to_speed+ mydeathroom( my_ahrsFeedback.Acc(3),1)*dt_s;

           
           %          计算GPS差分加速度
         
            for ii=1:97
              v_ned_est_mps_old(99-ii)=v_ned_est_mps_old(99-ii-1) ;   
            end
            v_ned_est_mps_old(1)= -ekf.xhat(10);
       my_ahrsFeedback.Acc_gps=(v_ned_est_mps_old(1)-v_ned_est_mps_old(10))/dt_s/10;
       my_ahrsFeedback.speed_H_gps  =  -ekf.xhat(10);
 
      
%  使用kalman融合GPS与加速度计
lag_time_for_acc=20;
%  保留旧制纯滞后滤波器
for ii=1:97
            my_ahrsFeedback.Acc_old(99-ii)=  my_ahrsFeedback.Acc_old(99-ii-1) ;  
            my_ahrsFeedback.Acc_oldx(99-ii)=  my_ahrsFeedback.Acc_oldx(99-ii-1) ;  
            my_ahrsFeedback.Acc_oldy(99-ii)=  my_ahrsFeedback.Acc_oldy(99-ii-1) ; 
end
 my_ahrsFeedback.Acc_old(1) =   my_ahrsFeedback.Acc(3);
  my_ahrsFeedback.Acc_oldx(1) =   my_ahrsFeedback.Acc(1);
   my_ahrsFeedback.Acc_oldy(1) =   my_ahrsFeedback.Acc(2);
filter.z(1) = h_msl_est_m; 
filter.u =  my_ahrsFeedback.Acc_old(lag_time_for_acc) ;
filter = Kalman_with_limit(filter);

filterx.z(1) = north_est_m;
filterx.u =  my_ahrsFeedback.Acc_oldx(lag_time_for_acc) ;
filterx = Kalman_with_limit(filterx);
% filterx = Kalman(filterx);
filtery.z(1) =  east_est_m;
filtery.u =  my_ahrsFeedback.Acc_oldy(lag_time_for_acc) ;
filtery = Kalman_with_limit(filtery);
%进一步处理滞后的位置与速度

 filter.advanced_speed = filter.x(2);
 filter.advanced_position = filter.x(1);
 filter.correct_acc = my_ahrsFeedback.Acc_old(1) - filter.x(3);
  
 filterx.advanced_speed = filterx.x(2);
 filterx.advanced_position = filterx.x(1);
 filterx.correct_acc = my_ahrsFeedback.Acc_oldx(1) - filterx.x(3);
 
 filtery.advanced_speed = filtery.x(2);
 filtery.advanced_position = filtery.x(1);
 filtery.correct_acc = my_ahrsFeedback.Acc_oldy(1) - filtery.x(3);
 for ii=1:lag_time_for_acc
            filter.advanced_speed =  filter.advanced_speed+ (my_ahrsFeedback.Acc_old(ii)-filter.x(3)) *dt_s; 
            filterx.advanced_speed =  filterx.advanced_speed+ (my_ahrsFeedback.Acc_oldx(ii)-filterx.x(3)) *dt_s; 
              filtery.advanced_speed =  filtery.advanced_speed+ (my_ahrsFeedback.Acc_oldy(ii)-filter.x(3)) *dt_s; 
            filter.advanced_position= filter.advanced_position+ filter.advanced_speed  *dt_s;     
             filterx.advanced_position= filterx.advanced_position+ filterx.advanced_speed  *dt_s;     
              filtery.advanced_position= filtery.advanced_position+ filtery.advanced_speed  *dt_s;     
 end

%保存滤波旧值计算加速度
            for ii=1:97
              filter.oled_speed(99-ii)=filter.oled_speed(99-ii-1) ;  
               filterx.oled_speed(99-ii)=filterx.oled_speed(99-ii-1) ;
                filtery.oled_speed(99-ii)=filtery.oled_speed(99-ii-1) ;
            end
  filter.oled_speed(1)= filter.x(2);
    filterx.oled_speed(1)= filterx.x(2);
      filtery.oled_speed(1)= filtery.x(2);
  filter.acc=(filter.oled_speed(1) -filter.oled_speed(3))/2/dt_s;
    filterx.acc=(filterx.oled_speed(1) -filterx.oled_speed(3))/2/dt_s;
      filtery.acc=(filtery.oled_speed(1) -filtery.oled_speed(3))/2/dt_s;
            %保存滤波旧值计算加结束
            
            
            
            
%     保存计算出来的加速度进行移位自相关
        for ii=1:97
               filter.acc_save(99-ii)=filter.acc_save(99-ii-1) ;   
            end
               filter.acc_save(1)= filter.acc;
   %     保存计算出来的加速度进行移位自相关结束         
            
            
      
% 死区函数
function  y = mydeathroom(x,deathroom)
if(abs(x)<deathroom)
    y= 0;
else
    y=x;
end

end