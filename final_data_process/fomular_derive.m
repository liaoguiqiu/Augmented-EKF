% 推导分析误差与倾角函数
%加速度计线运动加速度的误差
%理论角度为0
g_mps2 = 9.81; 
syms  pitch_rad  roll_rad  yaw_rad  accx accy accz
 C_ned2b  = [cos(pitch_rad)*cos(yaw_rad)                                             cos(pitch_rad)*sin(yaw_rad)                                           -sin(pitch_rad); ...
                sin(roll_rad)*sin(pitch_rad)*cos(yaw_rad)-cos(roll_rad)*sin(yaw_rad)    sin(roll_rad)*sin(pitch_rad)*sin(yaw_rad)+cos(roll_rad)*cos(yaw_rad)   sin(roll_rad)*cos(pitch_rad); ...
                cos(roll_rad)*sin(pitch_rad)*cos(yaw_rad)+sin(roll_rad)*sin(yaw_rad)    cos(roll_rad)*sin(pitch_rad)*sin(yaw_rad)-sin(roll_rad)*cos(yaw_rad)   cos(roll_rad)*cos(pitch_rad)];
 fb_mps2_perfect = C_ned2b*[accx ;accy;accz] - C_ned2b*[0;0;gravity_mps2];
 %加表直接计算影响
 fx = fb_mps2_perfect(1) ;fy = fb_mps2_perfect(2) ;fz = fb_mps2_perfect(3) ;
  pitch_test= asin(fx/(fx^2 + fy^2 + fz^2)^0.5);
 roll_test= atan(fb_mps2_perfect(2)/fb_mps2_perfect(3))

%  pitch_test= atan(fb_mps2_perfect(1)/fb_mps2_perfect(3))
%  roll_test= atan(fb_mps2_perfect(2)/fb_mps2_perfect(3))
 pitch_err =  - pitch_rad - atan(((981*sin(pitch_rad))/100 - accz*sin(pitch_rad) + accx*cos(pitch_rad)*cos(yaw_rad) + accy*cos(pitch_rad)*sin(yaw_rad))/((981*cos(pitch_rad)*cos(roll_rad))/100 - accx*(sin(roll_rad)*sin(yaw_rad) + cos(roll_rad)*cos(yaw_rad)*sin(pitch_rad)) + accy*(cos(yaw_rad)*sin(roll_rad) - cos(roll_rad)*sin(pitch_rad)*sin(yaw_rad)) - accz*cos(pitch_rad)*cos(roll_rad)));
 yaw_test  =  0; 
 C_ned2b_test  = [cos(pitch_test)*cos(yaw_test)                                             cos(pitch_test)*sin(yaw_test)                                           -sin(pitch_test); ...
                sin(roll_test)*sin(pitch_test)*cos(yaw_test)-cos(roll_test)*sin(yaw_test)    sin(roll_test)*sin(pitch_test)*sin(yaw_test)+cos(roll_test)*cos(yaw_test)   sin(roll_test)*cos(pitch_test); ...
                cos(roll_test)*sin(pitch_test)*cos(yaw_test)+sin(roll_test)*sin(yaw_test)    cos(roll_test)*sin(pitch_test)*sin(yaw_test)-sin(roll_test)*cos(yaw_test)   cos(roll_test)*cos(pitch_test)];
 C_b2ned_test=transpose(C_ned2b_test);
  acc_test =  C_b2ned_test*([fb_mps2_perfect(1);fb_mps2_perfect(2);fb_mps2_perfect(3)])+[0;0;g_mps2]; 
  acc_test_z = acc_test(3);
  %误差大小
  error =  acc_test_z - accz;
%  
%  
% syms  fxx1 fxx2 fxx3
%  pitch_test= atan(fxx1/fxx3)
%  roll_test= atan(fxx2/fxx3)
%  yaw_test  =  0; 
%  diff(pitch_test,fxx1);
%   C_ned2b  = [cos(pitch_test)*cos(yaw_test)                                             cos(pitch_test)*sin(yaw_test)                                           -sin(pitch_test); ...
%                 sin(roll_test)*sin(pitch_test)*cos(yaw_test)-cos(roll_test)*sin(yaw_test)    sin(roll_test)*sin(pitch_test)*sin(yaw_test)+cos(roll_test)*cos(yaw_test)   sin(roll_test)*cos(pitch_test); ...
%                 cos(roll_test)*sin(pitch_test)*cos(yaw_test)+sin(roll_test)*sin(yaw_test)    cos(roll_test)*sin(pitch_test)*sin(yaw_test)-sin(roll_test)*cos(yaw_test)   cos(roll_test)*cos(pitch_test)];
%  C_b2ned=transpose(C_ned2b);
%   acc_test =  C_b2ned*([fxx1;fxx2;fxx3])+[0;0;g_mps2]; 
%  
%  
% acc_test3 =  fxx3/((fxx1^2/fxx3^2 + 1)^(1/2)*(fxx2^2/fxx3^2 + 1)^(1/2)) - fxx1^2/(fxx3*(fxx1^2/fxx3^2 + 1)^(1/2)) + fxx2^2/(fxx3*(fxx1^2/fxx3^2 + 1)^(1/2)*(fxx2^2/fxx3^2 + 1)^(1/2)) + 981/100;
%  
 
 