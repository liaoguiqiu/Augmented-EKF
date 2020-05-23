 v_ned_est_mps_old=zeros(3,100);
 my_ahrsFeedback.Acc_old=zeros(3,50000);
 my_ahrsFeedback.Acc_GPS_old=zeros(3,50000);
 gyro_wb_rps_old=zeros(100,3);
  mag3D_unitVector_in_body_old=zeros(100,3);
  accel_fb_mps2_old =zeros(100,3);
        roll_est_deg   = 0;
        pitch_est_deg  = 0;
        yaw_est_deg    = 0;
        yaw_mag_rad =0;
        my_ahrsFeedback.intergral_speed=zeros(3,1);
           my_ahrsFeedback.right_delay_time_old=20;
           my_ahrsFeedback.right_delay_time  = 20;
        