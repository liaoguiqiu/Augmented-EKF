my_est_save.Acc(kTime,:) =my_ahrsFeedback.Acc;
      my_est_save.Acc_gps(kTime,:)=  my_ahrsFeedback.Acc_gps;
       my_est_save.speed_gps(kTime,:)  =   my_ahrsFeedback.speed_H_gps;
          my_est_save.xspeed_gps(kTime,:)=      GPS_v_ned_mps(1);
             my_est_save.yspeed_gps(kTime,:)=      GPS_v_ned_mps(2);
               
               
       my_est_save.Acc_to_speed(kTime,:)  =     my_ahrsFeedback.Acc_to_speed ;
         my_est_save.kalman_high_est(kTime,:) = filter.x(1);
         my_est_save.kalman_high_v_est(kTime,:) = filter.x(2);
          my_est_save.kalman_high_acc_est(kTime,:) = filter.acc;
             my_est_save.kf_position_advanced(kTime,:) =  filter.advanced_position;
               my_est_save.kf_speed_advanced(kTime,:) =  filter.advanced_speed;
                  my_est_save.correct_acc(kTime,:)=  filter.correct_acc ;
                  
        my_est_save.kalman_x_est(kTime,:) = filterx.x(1);
         my_est_save.kalman_x_v_est(kTime,:) = filterx.x(2);
          my_est_save.kalman_x_acc_est(kTime,:) = filterx.acc;
             my_est_save.kf_xposition_advanced(kTime,:) =  filterx.advanced_position;
               my_est_save.kf_xspeed_advanced(kTime,:) =  filterx.advanced_speed;
                  my_est_save.correct_xacc(kTime,:)=  filterx.correct_acc ;
                  
                                  
        my_est_save.kalman_y_est(kTime,:) = filtery.x(1);
         my_est_save.kalman_y_v_est(kTime,:) = filtery.x(2);
          my_est_save.kalman_y_acc_est(kTime,:) = filtery.acc;
             my_est_save.kf_yposition_advanced(kTime,:) =  filtery.advanced_position;
               my_est_save.kf_yspeed_advanced(kTime,:) =  filtery.advanced_speed;
                  my_est_save.correct_yacc(kTime,:)=  filtery.correct_acc ;