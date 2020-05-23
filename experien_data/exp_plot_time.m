 addpath G:\kalman_study\suas_code_v1\SUAS_Code\my_data_process 

truthLineType    = '-';
estimateLineType = '-.';
markerSize       = 7;
linewidth        = 2;
   
figure(11);
hold off;
% 小的序列是旧值
[correlation_off_ini_acc, energe]= correlation_of_two_singnal_long(acc_gps_fil( : ,1),acc_ini(:,1));
% [correlation_off_ini_acc, energe]= correlation_of_two_singnal(my_est_save.ini_speed(1:9000,2),my_est_save.intergral_speed(1:9000,2)-65);

plot(correlation_off_ini_acc,estimateLineType,'markersize',markerSize, 'linewidth', linewidth);hold on;grid on;
% Label figure
figure(gcf) % Bring figure to front
set(gcf,'name',sprintf('gps速度差分得到的加速度与加计相关度'));
figure(10);
hold off;
% plot(my_est_save.kalman_y_v_est,estimateLineType,'markersize',markerSize, 'linewidth', linewidth);hold on;grid on;
 plot(my_est_save.right_delay_time,'markersize',markerSize, 'linewidth', linewidth);hold on;grid on;
plot(my_est_save.delay_time1,estimateLineType,'markersize',markerSize, 'linewidth', linewidth);hold on;grid on; 
% plot( my_est_save.energe1/1000,estimateLineType,'markersize',markerSize, 'linewidth', linewidth);hold on;grid on; 
% Label figure
figure(gcf) % Bring figure to front
set(gcf,'name',sprintf('time1曲线 '));
figure(12);
hold off;
% plot(my_est_save.kalman_y_v_est,estimateLineType,'markersize',markerSize, 'linewidth', linewidth);hold on;grid on;
% plot(uavTruth.pitch_deg,'markersize',markerSize, 'linewidth', linewidth);hold on;grid on;
plot(my_est_save.delay_time2,estimateLineType,'markersize',markerSize, 'linewidth', linewidth);hold on;grid on; 
% plot( my_est_save.energe2/1000,estimateLineType,'markersize',markerSize, 'linewidth', linewidth);hold on;grid on; 
% Label figure
figure(gcf) % Bring figure to front
set(gcf,'name',sprintf('time2曲线 '));
figure(13);
hold off;
% plot(my_est_save.kalman_y_v_est,estimateLineType,'markersize',markerSize, 'linewidth', linewidth);hold on;grid on;
% plot(uavTruth.pitch_deg,'markersize',markerSize, 'linewidth', linewidth);hold on;grid on;
plot(my_est_save.delay_time3,estimateLineType,'markersize',markerSize, 'linewidth', linewidth);hold on;grid on; 
% plot( my_est_save.energe3/1000,estimateLineType,'markersize',markerSize, 'linewidth', linewidth);hold on;grid on; 
% Label figure
figure(gcf) % Bring figure to front
set(gcf,'name',sprintf('time3曲线 '));
figure(14);
hold off;
% plot(my_est_save.kalman_y_v_est,estimateLineType,'markersize',markerSize, 'linewidth', linewidth);hold on;grid on;
% plot(uavTruth.pitch_deg,'markersize',markerSize, 'linewidth', linewidth);hold on;grid on;
plot(acc_gps_fil(:,1),'markersize',markerSize, 'linewidth', linewidth);hold on;grid on; 
plot(acc_ini(:,1),'markersize',markerSize, 'linewidth', linewidth);hold on;grid on; 
% Label figure
figure(gcf) % Bring figure to front

set(gcf,'name',sprintf('1方向加速度比较'));
figure(15);
hold off;
% plot(my_est_save.kalman_y_v_est,estimateLineType,'markersize',markerSize, 'linewidth', linewidth);hold on;grid on;
% plot(uavTruth.pitch_deg,'markersize',markerSize, 'linewidth', linewidth);hold on;grid on;
plot(acc_gps_fil(:,2),'markersize',markerSize, 'linewidth', linewidth);hold on;grid on; 
plot(acc_ini(:,2),'markersize',markerSize, 'linewidth', linewidth);hold on;grid on; 
% Label figure
figure(gcf) % Bring figure to front
set(gcf,'name',sprintf('2方向加速度比较'));
figure(16);
hold off;
% plot(my_est_save.kalman_y_v_est,estimateLineType,'markersize',markerSize, 'linewidth', linewidth);hold on;grid on;
% plot(uavTruth.pitch_deg,'markersize',markerSize, 'linewidth', linewidth);hold on;grid on;
plot(acc_gps_fil(:,3),'markersize',markerSize, 'linewidth', linewidth);hold on;grid on; 
plot(acc_ini(:,3),'markersize',markerSize, 'linewidth', linewidth);hold on;grid on; 
% Label figure
figure(gcf) % Bring figure to front
set(gcf,'name',sprintf('3方向加速度比较'));
 