
figure(1)
hold off;
uavTruth2.time_s = 0:0.01:400;
uavTruth2.time_s = uavTruth2.time_s';
uavTruth2.east_m = interp1(uavTruth.time_s,uavTruth.east_m ,uavTruth2.time_s , 'cubic');
plot(uavTruth.time_s,uavTruth.east_m ,'o' ,uavTruth2.time_s,uavTruth2.east_m);hold on;

uavTruth2.north_m = interp1(uavTruth.time_s,uavTruth.north_m ,uavTruth2.time_s , 'cubic');
plot(uavTruth.time_s,uavTruth.north_m ,'o' ,uavTruth2.time_s,uavTruth2.north_m);hold on;

uavTruth2.h_msl_m = interp1(uavTruth.time_s,uavTruth.h_msl_m ,uavTruth2.time_s , 'cubic');
plot(uavTruth.time_s,uavTruth.h_msl_m ,'o' ,uavTruth2.time_s,uavTruth2.h_msl_m);hold on;

uavTruth2.yaw_deg = interp1(uavTruth.time_s,uavTruth.yaw_deg ,uavTruth2.time_s , 'cubic');
plot(uavTruth.time_s,uavTruth.yaw_deg ,'o' ,uavTruth2.time_s,uavTruth2.yaw_deg);hold on;

uavTruth2.pitch_deg = interp1(uavTruth.time_s,uavTruth.pitch_deg ,uavTruth2.time_s , 'cubic');
plot(uavTruth.time_s,uavTruth.pitch_deg ,'o' ,uavTruth2.time_s,uavTruth2.pitch_deg);hold on;

uavTruth2.roll_deg = interp1(uavTruth.time_s,uavTruth.roll_deg ,uavTruth2.time_s , 'cubic');
plot(uavTruth.time_s,uavTruth.roll_deg ,'o' ,uavTruth2.time_s,uavTruth2.roll_deg);hold on;

uavTruth2.temp_K = interp1(uavTruth.time_s,uavTruth.temp_K ,uavTruth2.time_s , 'cubic');
plot(uavTruth.time_s,uavTruth.temp_K ,'o' ,uavTruth2.time_s,uavTruth2.temp_K);hold on;

uavTruth2.pressure_Npm2 = interp1(uavTruth.time_s,uavTruth.pressure_Npm2 ,uavTruth2.time_s , 'cubic');
% plot(uavTruth.time_s,uavTruth.pressure_Npm2 ,'o' ,uavTruth2.time_s,uavTruth2.pressure_Npm2);hold on;

uavTruth2.density_kgpm3 = interp1(uavTruth.time_s,uavTruth.density_kgpm3 ,uavTruth2.time_s , 'cubic');
plot(uavTruth.time_s,uavTruth.density_kgpm3 ,'o' ,uavTruth2.time_s,uavTruth2.density_kgpm3);hold on;


figure(2)
hold off;
uavTruth2.v_ned_mps = interp1(uavTruth.time_s,uavTruth.v_ned_mps ,uavTruth2.time_s , 'cubic');
plot(uavTruth.time_s,uavTruth.v_ned_mps ,'o' ,uavTruth2.time_s,uavTruth2.v_ned_mps);hold on;

figure(3)
hold off;
uavTruth2.wb_rps = interp1(uavTruth.time_s,uavTruth.wb_rps ,uavTruth2.time_s , 'cubic');
plot(uavTruth.time_s,uavTruth.wb_rps ,'o' ,uavTruth2.time_s,uavTruth2.wb_rps);hold on;

figure(4)
hold off;
uavTruth2.v_wind_ned_mps = interp1(uavTruth.time_s,uavTruth.v_wind_ned_mps ,uavTruth2.time_s , 'cubic');
plot(uavTruth.time_s,uavTruth.v_wind_ned_mps ,'o' ,uavTruth2.time_s,uavTruth2.v_wind_ned_mps);hold on;

uavTruth=uavTruth2;
save('UavData_5_100hz.mat','uavTruth');
 