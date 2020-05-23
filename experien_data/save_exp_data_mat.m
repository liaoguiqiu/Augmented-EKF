
%用于保存实验运行结果的关键结构体，一定要在每次仿真运行结束后运行该文件
% 每次需要更改保存的文件名，以防将以前的文件覆盖
% my_est_save_add_delay = my_est_save;
% uavEst_well_acc_b  =  uavEst;
uavEst_time_by_argument_filter_state_worse = uavEst;
% uavsensor_well_acc_b  =  uavSensors;
save('uavEst_time_by_argument_filter_state_worse.mat','uavEst_time_by_argument_filter_state_worse');
% save('UavData_LetterE_uavEst_well_acc_b.mat','uavEst_well_acc_b');
% save('UavData_LetterE_uavsensor_well_acc_b.mat','uavsensor_well_acc_b');