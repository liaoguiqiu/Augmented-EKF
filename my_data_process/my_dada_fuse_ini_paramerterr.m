% 初始化

v_ned_est_mps_old= zeros(100,1);
my_ahrsFeedback.Acc_to_speed =0;

v_ned_est_mps_oldx= zeros(100,1);
my_ahrsFeedback.Acc_to_speedx =0;
v_ned_est_mps_oldy= zeros(100,1);
my_ahrsFeedback.Acc_to_speedy =0;
% % % % % kalman滤波的初始化

dim_observe = 1;      %观测值维数
n =3;  %状态维数，观测状态每个维度都有1个速度，故需乘2 P V ba
cQ = 2e-4;
cQ2 = 2e-4;
cQ3 = 2e-4;
cR = 7;
% filter.A = eye(n);%[1,0,1,0;0,1,0,1;0,0,1,0;0,0,0,1]; 
filter.A =[1,  0.1 , -0.5*0.1*0.1;... 
           0 ,   1 , -0.1;...
            0,   0,  1   ];% [1, deltaT;0 ,1]; 
        
filter.B = [0.1*0.1*0.5  ; 0.1;0];
% filter.B =0;
filter.u = 0;
filter.P = eye(n);
filter.K = zeros(n);
% filter.H = eye(n);%[1,0,0,0;0,1,0,0];
filter.H =  [1,0,0];
filter.Q =  [1*cQ 0 0;...
           0  0.4*cQ2  0;...
           0   0   0.00000001*cQ3];   %这里简单设置Q和R对角线元素都相等，设为不等亦可
filter.R =eye(dim_observe)*cR;
filter.x = zeros(n,1); %初始状态x0

filterx.A =[1,  0.1 , -0.5*0.1*0.1;... 
           0 ,   1 , -0.1;...
            0,   0,  1   ];% [1, deltaT;0 ,1]; 
        
filterx.B = [0.1*0.1*0.5  ; 0.1;0];
% filter.B =0;
filterx.u = 0;
filterx.P = eye(n);
filterx.K = zeros(n);
% filter.H = eye(n);%[1,0,0,0;0,1,0,0];
filterx.H =  [1,0,0];
filterx.Q =  [1*cQ 0 0;...
           0  0.4*cQ2  0;...
           0   0   0.00000001*cQ3];   %这里简单设置Q和R对角线元素都相等，设为不等亦可
filterx.R =eye(dim_observe)*cR;
filterx.x = zeros(n,1); %初始状态x0

filtery.A =[1,  0.1 , -0.5*0.1*0.1;... 
           0 ,   1 , -0.1;...
            0,   0,  1   ];% [1, deltaT;0 ,1]; 
        
filtery.B = [0.1*0.1*0.5  ; 0.1;0];
% filter.B =0;
filtery.u = 0;
filtery.P = eye(n);
filtery.K = zeros(n);
% filter.H = eye(n);%[1,0,0,0;0,1,0,0];
filtery.H =  [1,0,0];
filtery.Q =  [1*cQ 0 0;...
           0  0.4*cQ2  0;...
           0   0   0.00000001*cQ3];   %这里简单设置Q和R对角线元素都相等，设为不等亦可
filtery.R =eye(dim_observe)*cR;
filtery.x = zeros(n,1); %初始状态x0

filter.oled_speed=zeros(100,1); 
filterx.oled_speed=zeros(100,1); 
filtery.oled_speed=zeros(100,1); 
  my_ahrsFeedback.Acc_old =zeros(100,1); 
  my_ahrsFeedback.Acc_oldy =zeros(100,1); 
  my_ahrsFeedback.Acc_oldx=zeros(100,1); 
   my_ahrsFeedback.Vb_real=[0; 0 ;0];
   filter.acc_save = zeros(100,1); 
     filterx.acc_save = zeros(100,1); 
       filtery.acc_save = zeros(100,1); 
   filter.advanced_position=0;
     filterx.advanced_position=0;
       filtery.advanced_position=0;
 filter.advanced_speed=0;
     filterx.advanced_speed=0;
       filtery.advanced_speed=0; 
       
          gyro_wb_rps_old= zeros(100,3); 
         mag3D_unitVector_in_body_old= zeros(100,3); 
          accel_fb_mps2_old= zeros(100,3); 
% % % % % kalman滤波的初始化结束