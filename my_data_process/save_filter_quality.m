  if GPS_valid
  zeta =  ekf.z - ekf.H *ekf.xhat;  
  my_est_save.zeta(kTime,:) = zeta;
  my_est_save.mse(kTime,:) = zeta'*zeta;
  end