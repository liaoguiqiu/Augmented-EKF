
% 计算线速度
 my_ahrsFeedback.Acc =   C_ned2b'*(accel_fb_mps2_old(1,:)' - [ekf.xhat(14);ekf.xhat(15);ekf.xhat(16)])...
     + [0;0;9.81 ];
%    my_ahrsFeedback.intergral_speed(3) = my_ahrsFeedback.intergral_speed(3) + dt_s*mydeathroom(my_ahrsFeedback.Acc(3),0.1);
%    my_ahrsFeedback.intergral_speed(1) = my_ahrsFeedback.intergral_speed(1) + dt_s*mydeathroom(my_ahrsFeedback.Acc(1),0.1);
%    my_ahrsFeedback.intergral_speed(2) = my_ahrsFeedback.intergral_speed(2) + dt_s*mydeathroom(my_ahrsFeedback.Acc(2),0.1);
%   
 %   my_ahrsFeedback.Acc =  accel_fb_mps2;
%  my_ahrsFeedback.Acc(3)=     my_ahrsFeedback.Acc(3);
%  保留先加速度旧值
save_old_acc_length=600;
for ii=1:(save_old_acc_length-2)
            my_ahrsFeedback.Acc_old(:,save_old_acc_length-ii)=  my_ahrsFeedback.Acc_old(:,save_old_acc_length-ii-1) ;  
end
  my_ahrsFeedback.Acc_old(:,1) = my_ahrsFeedback.Acc;

  %          计算GPS差分加速度
         
            for ii=1:97
              v_ned_est_mps_old(:,99-ii)=v_ned_est_mps_old(:,99-ii-1) ;   
            end
            v_ned_est_mps_old(:,1)= [initial_speed_save(1); initial_speed_save(2) ;initial_speed_save(3)];
            my_ahrsFeedback.Acc_gps=(v_ned_est_mps_old(:,1)-v_ned_est_mps_old(:,20))/dt_s/19;
          
 for ii=1:(save_old_acc_length-2)
            my_ahrsFeedback.Acc_GPS_old(:,save_old_acc_length-ii)=  my_ahrsFeedback.Acc_GPS_old(:,save_old_acc_length-ii-1) ;  
end
  my_ahrsFeedback.Acc_GPS_old(:,1) =  my_ahrsFeedback.Acc_gps;

    %时间误差估计
%     energy_threshold=0.2;
%            [my_ahrsFeedback.correlation_of_acc1 ,my_ahrsFeedback.energe1]  = correlation_of_two_singnal( my_ahrsFeedback.Acc_old(1,1:save_old_acc_length) ,my_ahrsFeedback.Acc_GPS_old(1,1:save_old_acc_length));
%            [my_ahrsFeedback.max_correlation1, my_ahrsFeedback.delay_time1] = max( my_ahrsFeedback.correlation_of_acc1);
%             [my_ahrsFeedback.correlation_of_acc2 ,my_ahrsFeedback.energe2]  = correlation_of_two_singnal( my_ahrsFeedback.Acc_old(2,1:save_old_acc_length) ,my_ahrsFeedback.Acc_GPS_old(2,1:save_old_acc_length));
%            [my_ahrsFeedback.max_correlation2, my_ahrsFeedback.delay_time2] = max( my_ahrsFeedback.correlation_of_acc2);
%             [my_ahrsFeedback.correlation_of_acc3 ,my_ahrsFeedback.energe3]  = correlation_of_two_singnal( my_ahrsFeedback.Acc_old(3,1:save_old_acc_length) ,my_ahrsFeedback.Acc_GPS_old(3,1:save_old_acc_length));
%            [my_ahrsFeedback.max_correlation3, my_ahrsFeedback.delay_time3] = max( my_ahrsFeedback.correlation_of_acc3);
%          my_ahrsFeedback.delay_time1=my_ahrsFeedback.delay_time1-67;
%          my_ahrsFeedback.delay_time2=my_ahrsFeedback.delay_time2-67;
%           my_ahrsFeedback.delay_time3=my_ahrsFeedback.delay_time3-67;
%      %融合     
%     filter1.z= my_ahrsFeedback.delay_time1;
%     filter2.z= my_ahrsFeedback.delay_time2;
%     filter3.z= my_ahrsFeedback.delay_time3;
%     if(my_ahrsFeedback.energe1>energy_threshold)
%     filter1.ok= 1;
%     else
%      filter1.ok= 0;
%     end
%        if(my_ahrsFeedback.energe3>energy_threshold)
%     filter3.ok= 1;
%     else
%      filter3.ok= 0;
%        end
%     if(my_ahrsFeedback.energe2>energy_threshold)
%     filter2.ok= 1;
%     else
%      filter2.ok= 0;
%     end
% %     filter.z = z(:,i);
% %     filter = Kalman(filter);
%   if(filter1.ok==1 ||filter2.ok==1||filter3.ok==1)
%    [filterf,filter1,filter2,filter3] =  Kalman_fuse_3sensors (filterf,filter1,filter2,filter3);
%   end
%    my_ahrsFeedback.right_delay_time = filterf.x;
%    my_ahrsFeedback.right_delay_time  = limit(my_ahrsFeedback.right_delay_time,1,30 );

   
   %            my_ahrsFeedback.all_energe = [my_ahrsFeedback.energe1   my_ahrsFeedback.energe2  my_ahrsFeedback.energe3 ];
%             my_ahrsFeedback.all_time  =  [my_ahrsFeedback.delay_time1   my_ahrsFeedback.delay_time2   my_ahrsFeedback.delay_time3 ];
%            [max_energe, max_energee_index] = max( my_ahrsFeedback.all_energe );
%            if(max_energe>600)
%            my_ahrsFeedback.right_delay_time =  my_ahrsFeedback.all_time (max_energee_index);
%            end

function  y = limit(x,a,b)
  if (x<a)
    y= a;
  elseif  (x>b)
    y=b;
  else
    y=x;     
end

end
% 死区函数
function  y = mydeathroom(x,deathroom)
if(abs(x)<deathroom)
    y= 0;
else
    y=x;
end

end

   
   