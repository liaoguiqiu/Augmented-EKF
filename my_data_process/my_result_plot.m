truthLineType    = '-';
estimateLineType = '.';
markerSize       = 4;
linewidth        = 1;

figure(3);
hold off;
plot(my_est_save.Acc(:,3)*100);hold on;grid on;
plot(my_est_save.speed_gps *100);hold on;grid on;
plot(my_est_save.Acc_to_speed *100);hold on;grid on;
plot(uavEst.h_msl_m);hold on;grid on;
plot(uavTruth.h_msl_m);hold on;grid on;

figure(14);
hold off;
plot(my_est_save.kalman_x_est,estimateLineType, 'markersize',markerSize, 'linewidth', linewidth);hold on;grid on;
plot(uavEst.north_m, estimateLineType,'markersize',markerSize, 'linewidth', linewidth);hold on;grid on;
plot(uavTruth.north_m,truthLineType, 'markersize',markerSize, 'linewidth', linewidth);hold on;grid on;
% plot(my_est_save.kf_position_advanced,estimateLineType, 'markersize',markerSize, 'linewidth', linewidth);hold on;grid on;
% Label figure
figure(gcf) % Bring figure to front
set(gcf,'name',sprintf('x位置融合曲线 '));


figure(15);
hold off;
plot(my_est_save.kalman_y_est,estimateLineType, 'markersize',markerSize, 'linewidth', linewidth);hold on;grid on;
plot(uavEst.east_m, estimateLineType,'markersize',markerSize, 'linewidth', linewidth);hold on;grid on;
plot(uavTruth.east_m,truthLineType, 'markersize',markerSize, 'linewidth', linewidth);hold on;grid on;
% plot(my_est_save.kf_position_advanced,estimateLineType, 'markersize',markerSize, 'linewidth', linewidth);hold on;grid on;
% Label figure
figure(gcf) % Bring figure to front
set(gcf,'name',sprintf('y位置融合曲线 '));

% 
figure(4);
hold off;
plot(my_est_save.kalman_high_est,estimateLineType, 'markersize',markerSize, 'linewidth', linewidth);hold on;grid on;
plot(uavEst.h_msl_m, estimateLineType,'markersize',markerSize, 'linewidth', linewidth);hold on;grid on;
plot(uavTruth.h_msl_m,truthLineType, 'markersize',markerSize, 'linewidth', linewidth);hold on;grid on;
plot(my_est_save.kf_position_advanced,estimateLineType, 'markersize',markerSize, 'linewidth', linewidth);hold on;grid on;
% Label figure
figure(gcf) % Bring figure to front
set(gcf,'name',sprintf('位置融合曲线 '));
% 
figure(5);
hold off;
plot(my_est_save.kalman_y_v_est,estimateLineType,'markersize',markerSize, 'linewidth', linewidth);hold on;grid on;
plot(my_est_save.yspeed_gps,estimateLineType,'markersize',markerSize, 'linewidth', linewidth);hold on;grid on;
plot(uavTruth.v_ned_mps(:,2),estimateLineType,'markersize',markerSize, 'linewidth', linewidth);hold on;grid on; 
plot(my_est_save.kf_yspeed_advanced,estimateLineType,'markersize',markerSize, 'linewidth', linewidth);hold on;grid on; 

% Label figure
figure(gcf) % Bring figure to front
set(gcf,'name',sprintf('速度融合曲线 '));


figure(6);
hold off;
plot( my_est_save.kalman_x_acc_est,'r', 'markersize',markerSize, 'linewidth', linewidth);hold on;grid on;
 plot(my_est_save.Acc(:,1),'g', 'markersize',markerSize, 'linewidth', linewidth);hold on;grid on;
 plot(my_est_save.correct_xacc,'b', 'markersize',markerSize, 'linewidth', linewidth);hold on;grid on;
 plot(uavTruth.vdot_ned_mps2(:,1),'y', 'markersize',markerSize, 'linewidth', linewidth);hold on;grid on;
 % Label figure
figure(gcf) % Bring figure to front
set(gcf,'name',sprintf('显示融合的加速度与加表加速度'));


figure(12);
hold off;
% plot( my_est_save.kalman_high_acc_est,'r', 'markersize',markerSize, 'linewidth', linewidth);hold on;grid on;
 plot((my_est_save.Acc(:,3)+uavTruth.vdot_ned_mps2(:,3)).*(my_est_save.Acc(:,3)+uavTruth.vdot_ned_mps2(:,3))...
     ,'g', 'markersize',markerSize, 'linewidth', linewidth);hold on;grid on;
 plot((my_est_save.correct_acc+uavTruth.vdot_ned_mps2(:,3)).*(my_est_save.correct_acc+uavTruth.vdot_ned_mps2(:,3))...
     ,'b', 'markersize',markerSize, 'linewidth', linewidth);hold on;grid on;
resuit1111=(my_est_save.Acc(:,3)+uavTruth.vdot_ned_mps2(:,3)).*(my_est_save.Acc(:,3)+uavTruth.vdot_ned_mps2(:,3));
result2222=  (my_est_save.correct_acc+uavTruth.vdot_ned_mps2(:,3)).*(my_est_save.correct_acc+uavTruth.vdot_ned_mps2(:,3));
 sum(resuit1111(2000:4000))
 sum(result2222(2000:4000))
%  plot(-uavTruth.vdot_ned_mps2(:,3),'y', 'markersize',markerSize, 'linewidth', linewidth);hold on;grid on;
 % Label figure
figure(gcf) % Bring figure to front
set(gcf,'name',sprintf('融合加速度误差'));



figure(10);
hold off;
plot(my_est_save.Acc(:,3), 'markersize',markerSize, 'linewidth', linewidth);hold on;grid on;
plot( my_est_save.Acc_gps, 'markersize',markerSize, 'linewidth', linewidth);hold on;grid on;
% Label figure
figure(gcf) % Bring figure to front
set(gcf,'name',sprintf('显示GPS微分加速度与加表加速度'));
% 延时的计算
% inner_product;
figure(8);
hold off;
correlation_off_acc= correlation_of_two_singnal(my_est_save.kalman_high_acc_est,my_est_save.Acc(:,3));
plot(-50:50,correlation_off_acc);hold on;grid on;
% Label figure
figure(gcf) % Bring figure to front
set(gcf,'name',sprintf('融合的加速度与加表进行相关'));


figure(9);
hold off;
correlation_off_speed= correlation_of_two_singnal(my_est_save.kalman_high_v_est,my_est_save.speed_gps);
plot(-50:50,correlation_off_speed);hold on;grid on;
% Label figure
figure(gcf) % Bring figure to front
set(gcf,'name',sprintf('融合的速度与GPS速度进行相关'));


figure(11);
hold off;
correlation_off_ini_acc= correlation_of_two_singnal(my_est_save.Acc(:,3),my_est_save.Acc_gps);
plot(-50:50,correlation_off_ini_acc,estimateLineType,'markersize',markerSize, 'linewidth', linewidth);hold on;grid on;
% Label figure
figure(gcf) % Bring figure to front
set(gcf,'name',sprintf('gps速度差分得到的加速度与加计相关度'));



figure(12);
hold off;
plot(my_est_save.Acc(:,1),'r', 'markersize',markerSize, 'linewidth', linewidth);hold on;grid on;
 plot(uavTruth.vdot_ned_mps2(:,1),'b', 'markersize',markerSize, 'linewidth', linewidth);hold on;grid on;% Label figure
figure(gcf) % Bring figure to front
set(gcf,'name',sprintf('北向的加速度'));


figure(13);
hold off;
plot(my_est_save.Acc(:,2),'r', 'markersize',markerSize, 'linewidth', linewidth);hold on;grid on;
 plot(uavTruth.vdot_ned_mps2(:,2),'b', 'markersize',markerSize, 'linewidth', linewidth);hold on;grid on;% Label figure
figure(gcf) % Bring figure to front
set(gcf,'name',sprintf('东向的加速度'));
%计算角度偏差
result_angle_err= uavEst.roll_deg - uavTruth.roll_deg;
result_angle_err=result_angle_err.*result_angle_err;
sum(result_angle_err(3000:4000))


display_uav_estimate_results
