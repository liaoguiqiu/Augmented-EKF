save_old_acc_length=1000;
kf_fuse_init;
my_ini_2;
load fir_b.mat
    my_ahrsFeedback.delay_time1=0;
         my_ahrsFeedback.delay_time2=0;
          my_ahrsFeedback.delay_time3=0;
          my_ahrsFeedback.energe1=0;
            my_ahrsFeedback.energe2=0;
            my_ahrsFeedback.energe3=0;
            my_ahrsFeedback.right_delay_time  = 0;
            
             energy_threshold=0.0;
 
% 对GPS速度处理以及加速度处理的到用于相关的加速度             
       v_save= zeros(3,100);
       dt_s = 0.04;
for kTime=1:length(accbx_DATA7)
    
    
  %          计算GPS差分加速度
         
            for ii=1:97
              v_save(:,99-ii)=v_save(:,99-ii-1) ;   
            end
            v_save(:,1)= [gpsvx_b_DATA18(kTime); - gpsvy_b_DATA19(kTime);  gpsvz_DATA15(kTime)];
            my_ahrsFeedback.Acc_gps=(v_save(:,1)-v_save(:,20))/dt_s/19;
            %人为的加入延时
%                my_ahrsFeedback.Acc_gps=(v_save(:,31)-v_save(:,50))/dt_s/19;
           acc_gps_fil(kTime,:) =  ( my_ahrsFeedback.Acc_gps    )';
end
acc_gps_fil = [filter(fir_b,1,acc_gps_fil(:,1)) filter(fir_b,1,acc_gps_fil(:,2))  filter(fir_b,1,acc_gps_fil(:,3))    ] ;
acc_ini = [  filter(fir_b,1,accbx_DATA7)   filter(fir_b,1,accby_DATA8)   filter(fir_b,1,accbz_DATA9)     ];
     
     
for kTime=1:length(accbx_DATA7)
        if(kTime<save_old_acc_length)
         ;
        else
            if(mod(kTime,1)==0)
%          my_ahrsFeedback.Acc_GPS_old(:,1:save_old_acc_length)= my_est_save.Acc_gps((kTime-save_old_acc_length+1):kTime,:)'; 
        my_ahrsFeedback.Acc_GPS_old(:,1:save_old_acc_length)= acc_gps_fil((kTime-save_old_acc_length+1):kTime,:)'; 
      
      my_ahrsFeedback.Acc_old(:,1:save_old_acc_length)= acc_ini((kTime-save_old_acc_length+1):kTime,:)';  
               %时间误差估计
   
           [my_ahrsFeedback.correlation_of_acc1 ,my_ahrsFeedback.energe1]  = correlation_of_two_singnal( my_ahrsFeedback.Acc_old(1,1:save_old_acc_length) ,my_ahrsFeedback.Acc_GPS_old(1,1:save_old_acc_length));
           [my_ahrsFeedback.max_correlation1, my_ahrsFeedback.delay_time1] = max( my_ahrsFeedback.correlation_of_acc1);
            [my_ahrsFeedback.correlation_of_acc2 ,my_ahrsFeedback.energe2]  = correlation_of_two_singnal( my_ahrsFeedback.Acc_old(2,1:save_old_acc_length) ,my_ahrsFeedback.Acc_GPS_old(2,1:save_old_acc_length));
           [my_ahrsFeedback.max_correlation2, my_ahrsFeedback.delay_time2] = max( my_ahrsFeedback.correlation_of_acc2);
            [my_ahrsFeedback.correlation_of_acc3 ,my_ahrsFeedback.energe3]  = correlation_of_two_singnal( my_ahrsFeedback.Acc_old(3,1:save_old_acc_length) ,my_ahrsFeedback.Acc_GPS_old(3,1:save_old_acc_length));
           [my_ahrsFeedback.max_correlation3, my_ahrsFeedback.delay_time3] = max( my_ahrsFeedback.correlation_of_acc3);
%          my_ahrsFeedback.delay_time1=my_ahrsFeedback.delay_time1-67;
%          my_ahrsFeedback.delay_time2=my_ahrsFeedback.delay_time2-67;
%           my_ahrsFeedback.delay_time3=my_ahrsFeedback.delay_time3-67;
  my_ahrsFeedback.delay_time1=50- my_ahrsFeedback.delay_time1 -  0 ;
         my_ahrsFeedback.delay_time2=50-my_ahrsFeedback.delay_time2 - 0 ;
          my_ahrsFeedback.delay_time3=50-my_ahrsFeedback.delay_time3 - 0;
     %融合     
    filter1.z= my_ahrsFeedback.delay_time1;
    filter2.z= my_ahrsFeedback.delay_time2;
    filter3.z= my_ahrsFeedback.delay_time3;
%     if(abs(20 - my_ahrsFeedback.delay_time1 )>10)
%       filter1.z =20 ;   
%     end
%        if(abs(20 - my_ahrsFeedback.delay_time2 )>10)
%       filter2.z =20 ;   
%        end
%     if(abs(20 - my_ahrsFeedback.delay_time3)>10)
%       filter3.z =20 ;   
%     end
   % 限制变化幅度
   
    if(my_ahrsFeedback.energe1>energy_threshold)
    filter1.ok= 1;
    else
     filter1.ok= 0;
    end
    
    
%        if(my_ahrsFeedback.energe3>energy_threshold)
%     filter3.ok= 1;
%     else
     filter3.ok= 0;
    
     
     
    if(my_ahrsFeedback.energe2>energy_threshold)
    filter2.ok= 1;
    else
     filter2.ok= 0;
    end
%     filter.z = z(:,i);
%     filter = Kalman(filter);
              if(filter1.ok==1 ||filter2.ok==1||filter3.ok==1)
               [filterf,filter1,filter2,filter3] =  Kalman_fuse_3sensors (filterf,filter1,filter2,filter3);
              end
               my_ahrsFeedback.right_delay_time = filterf.x;
               my_ahrsFeedback.right_delay_time  = limit(my_ahrsFeedback.right_delay_time,1,60 );
            
            end
        end
   
 my_save_time;
   % Note progress with dots
    if mod(kTime,ceil(length(accbx_DATA7)/40))==0
        fprintf('.');
    end
end
 exp_plot_time;

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

   
   