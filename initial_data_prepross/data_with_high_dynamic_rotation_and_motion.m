 Am = 10 ;  % amplitude
% first span
span1 = zeros(1,10000);
%second span 
 t=0:0.01:400;
total_sin = Am* sin(0.0009*t.*t);
%构造指数部分
t2= 0:1:length(total_sin)-1;
t2 =6* t2 /max(t2);
total_e1 = exp(t2);
total_e = total_e1 /max(total_e1);
%合成
total = total_sin .*total_e ;
total = [span1 , total];
t = (1:1:length(total))*0.01;
 %数据生成
 
uavTruth2.time_s =t';
uavTruth2.roll_deg= total';
uavTruth2.pitch_deg = total';

uavTruth2.yaw_deg  = total' * 0;
uavTruth2.pressure_Npm2 = total' * 0;
uavTruth2.density_kgpm3 = total' * 0;
uavTruth2.temp_K = total' * 0; 
uavTruth2.north_m =  total';
uavTruth2.east_m =  total';
uavTruth2.h_msl_m =  total';
% uavTruth2.east_m = interp1(1:1:length(total),uavTruth2.east_m ,uavTruth2.time_s , 'cubic');
% uavTruth2.north_m = interp1(1:1:length(total),uavTruth2.north_m ,uavTruth2.time_s , 'cubic');
% uavTruth2.h_msl_m = interp1(1:1:length(total),uavTruth2.h_msl_m ,uavTruth2.time_s , 'cubic');
% uavTruth2.yaw_deg = interp1(1:1:length(total),uavTruth2.yaw_deg ,uavTruth2.time_s , 'cubic');
% uavTruth2.pitch_deg = interp1(1:1:length(total),uavTruth2.pitch_deg ,uavTruth2.time_s , 'cubic');
% uavTruth2.roll_deg = interp1(1:1:length(total),uavTruth2.roll_deg ,uavTruth2.time_s , 'cubic');
vn = gradient( uavTruth2.north_m ,uavTruth2.time_s);
an = gradient( vn,uavTruth2.time_s/10);
ve = gradient( uavTruth2.east_m ,uavTruth2.time_s);
vd = - gradient( uavTruth2.h_msl_m,uavTruth2.time_s);
w1 = gradient( uavTruth2.roll_deg ,uavTruth2.time_s)/180*pi;
w2 = gradient( uavTruth2.pitch_deg ,uavTruth2.time_s)/180*pi;
w3 = gradient( uavTruth2.yaw_deg ,uavTruth2.time_s)/180*pi;
uavTruth2.v_ned_mps = [vn ,ve,vd];
uavTruth2.wb_rps    = [w1 ,w2,w3];
uavTruth2.v_wind_ned_mps = uavTruth2.temp_K ;
uavTruth=uavTruth2;
save('my_high_dynamic.mat','uavTruth');

