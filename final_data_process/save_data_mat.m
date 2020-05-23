
%用于保存运行结果的关键结构体，一定要在每次仿真运行结束后运行该文件
% 每次需要更改保存的文件名，以防将以前的文件覆盖
my_est_save_well_time6_23 = my_est_save;
uavEst_well_time6_23  =  uavEst;
uavsensor_well_time6_23 =  uavSensors;
save('UavData_LetterE_my_est_save_well_time6_23.mat','my_est_save_well_time6_23');
save('UavData_LetterE_uavEst_well_time6_23.mat','uavEst_well_time6_23');
save('UavData_LetterE_uavsensor_well_time6_23.mat','uavsensor_well_time6_23');