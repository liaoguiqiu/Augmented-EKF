%该文件使用算法跑完保存的算法文件进行计算时间延时如果没有文件可以调用下面文件
%  
load('my_est_save_nice_time.mat');
load('uavSensors_paper_method.mat');
load('uavTruth_paper_method.mat');
my_est_save = my_est_save_nice_time;
uavSensors  = uavSensors_paper_method;
uavTruth = uavTruth_paper_method;
%  
load('fir_b.mat');
save_old_acc_length=4000;
kf_fuse_init;
    my_ahrsFeedback.delay_time1=0;
         my_ahrsFeedback.delay_time2=0;
          my_ahrsFeedback.delay_time3=0;
          my_ahrsFeedback.energe1=0;
            my_ahrsFeedback.energe2=0;
            my_ahrsFeedback.energe3=0;
            my_ahrsFeedback.right_delay_time  = 0;
            
             energy_threshold=0.26;
    
             acc_gps_fil = [filter(fir_b,1,my_est_save.Acc_gps(:,1))  filter(fir_b,1,my_est_save.Acc_gps(:,2))  filter(fir_b,1,my_est_save.Acc_gps(:,3))] ;
             acc_ini = [  filter(fir_b,1,my_est_save.Acc(:,1))    filter(fir_b,1,my_est_save.Acc(:,2))    filter(fir_b,1,my_est_save.Acc(:,3))  ];
             
             acc_gps_fil = [filter(fir_b,1,acc_gps_fil(:,1))  filter(fir_b,1,acc_gps_fil(:,2))  filter(fir_b,1,acc_gps_fil(:,3))] ;
             acc_ini = [  filter(fir_b,1,acc_ini(:,1))    filter(fir_b,1,acc_ini(:,2))    filter(fir_b,1,acc_ini(:,3))  ];
            
     l_delay_time = zeros(1,3);
             
for kTime=1:length(uavSensors.time_s)
        if(kTime<save_old_acc_length)
         ;
        else
            if(mod(kTime,5)==0)
%          my_ahrsFeedback.Acc_GPS_old(:,1:save_old_acc_length)= my_est_save.Acc_gps((kTime-save_old_acc_length+1):kTime,:)'; 
        my_ahrsFeedback.Acc_GPS_old(:,1:save_old_acc_length)= acc_gps_fil((kTime-save_old_acc_length+1):kTime,:)'; 
      
      my_ahrsFeedback.Acc_old(:,1:save_old_acc_length)= acc_ini((kTime-save_old_acc_length+1):kTime,:)';  
               %时间误差估计
   
           [my_ahrsFeedback.correlation_of_acc1 ,my_ahrsFeedback.energe1]  = correlation_of_two_singnal2( my_ahrsFeedback.Acc_old(1,1:save_old_acc_length) ,my_ahrsFeedback.Acc_GPS_old(1,1:save_old_acc_length));
           [my_ahrsFeedback.max_correlation1, my_ahrsFeedback.delay_time1] = max( my_ahrsFeedback.correlation_of_acc1);
            [my_ahrsFeedback.correlation_of_acc2 ,my_ahrsFeedback.energe2]  = correlation_of_two_singnal2( my_ahrsFeedback.Acc_old(2,1:save_old_acc_length) ,my_ahrsFeedback.Acc_GPS_old(2,1:save_old_acc_length));
           [my_ahrsFeedback.max_correlation2, my_ahrsFeedback.delay_time2] = max( my_ahrsFeedback.correlation_of_acc2);
            [my_ahrsFeedback.correlation_of_acc3 ,my_ahrsFeedback.energe3]  = correlation_of_two_singnal2( my_ahrsFeedback.Acc_old(3,1:save_old_acc_length) ,my_ahrsFeedback.Acc_GPS_old(3,1:save_old_acc_length));
           [my_ahrsFeedback.max_correlation3, my_ahrsFeedback.delay_time3] = max( my_ahrsFeedback.correlation_of_acc3);
%          my_ahrsFeedback.delay_time1=my_ahrsFeedback.delay_time1-67;
%          my_ahrsFeedback.delay_time2=my_ahrsFeedback.delay_time2-67;
%           my_ahrsFeedback.delay_time3=my_ahrsFeedback.delay_time3-67;
         my_ahrsFeedback.delay_time1=50-my_ahrsFeedback.delay_time1 -  13 ;
         my_ahrsFeedback.delay_time2=50-my_ahrsFeedback.delay_time2 - 13 ;
         my_ahrsFeedback.delay_time3=50-my_ahrsFeedback.delay_time3 - 13;
         
         l_delay_time(1) =  my_ahrsFeedback.delay_time1 ;
         l_delay_time(2) =  my_ahrsFeedback.delay_time1 ;
         l_delay_time(3) =  my_ahrsFeedback.delay_time1 ;
     %融合     
    filter1.z= my_ahrsFeedback.delay_time1;
    filter2.z= my_ahrsFeedback.delay_time2;
    filter3.z= my_ahrsFeedback.delay_time3;

   % 限制变化幅度
   
    if(my_ahrsFeedback.energe1>energy_threshold)
    filter1.ok= 1;
    else
     filter1.ok= 0;
    end
       if(my_ahrsFeedback.energe3>energy_threshold)
    filter3.ok= 1;
    else
     filter3.ok= 0;
       end
    if(my_ahrsFeedback.energe2>energy_threshold)
    filter2.ok= 1;
    else
     filter2.ok= 0;
    end
    
      if(abs(20 - my_ahrsFeedback.delay_time1 )>10)
      filter1.ok =0 ;   
      end
       if(abs(20 - my_ahrsFeedback.delay_time2 )>10)
      filter2.ok=0 ;   
       end
        if(abs(20 - my_ahrsFeedback.delay_time3)>10)
         filter3.ok =0 ;   
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
   % Note progress with dots Qiu draw 40 dots
    if mod(kTime, int16(length(uavSensors.time_s)/40))==0
        fprintf('.');
    end
end
 my_plot_2;

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

   
   