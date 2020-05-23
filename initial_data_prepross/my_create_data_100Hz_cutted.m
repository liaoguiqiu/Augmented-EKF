
 uavTruth2.time_s  =  uavTruth.time_s(1:10000);
uavTruth2.east_m  =  uavTruth.east_m(1:10000);
uavTruth2.north_m  =  uavTruth.north_m(1:10000);
uavTruth2.h_msl_m  =  uavTruth.h_msl_m(1:10000);
uavTruth2.yaw_deg  =  uavTruth.yaw_deg(1:10000);
uavTruth2.pitch_deg  =  uavTruth.pitch_deg(1:10000);
uavTruth2.roll_deg  =  uavTruth.roll_deg(1:10000);
uavTruth2.temp_K  =  uavTruth.temp_K(1:10000);
uavTruth2.pressure_Npm2  =  uavTruth.pressure_Npm2(1:10000);
uavTruth2.density_kgpm3  =  uavTruth.density_kgpm3(1:10000);
uavTruth2.v_ned_mps  =  uavTruth.v_ned_mps(1:10000,:);
uavTruth2.wb_rps  =  uavTruth.wb_rps(1:10000,:);
uavTruth2.v_wind_ned_mps  =  uavTruth.v_wind_ned_mps(1:10000,:);
uavTruth2.vdot_ned_mps2  =  uavTruth.vdot_ned_mps2(1:10000,:);




   
uavTruth=uavTruth2;
save('UavData_LetterE_100hz_cut1.mat','uavTruth');
 