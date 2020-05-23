 addpath G:\kalman_study\suas_code_v1\SUAS_Code\my_data_process 

truthLineType    = '-';
estimateLineType = '-.';
markerSize       = 7;
linewidth        = 2;

% 
figure(4);
grid on;
hold off;
plot(my_est_save.ini_potion(:,3),estimateLineType, 'markersize',markerSize, 'linewidth', linewidth);hold on;grid on;
plot(my_est_save.ad_pos(:,3), estimateLineType,'markersize',markerSize, 'linewidth', linewidth);hold on;grid on;
plot(uavTruth.h_msl_m,truthLineType, 'markersize',markerSize, 'linewidth', linewidth);hold on;grid on;
plot(my_est_save.est_pos(:,3),estimateLineType, 'markersize',markerSize, 'linewidth', linewidth);hold on;grid on;
legend('GPS-initial','Forward-est','True','delay-est');
% Label figure
figure(gcf) % Bring figure to front
set(gcf,'name',sprintf('位置融合曲线 '));

% 
figure(5);

hold off;
plot(my_est_save.ad_speed(:,3),estimateLineType,'markersize',markerSize, 'linewidth', linewidth);hold on;grid on;
plot(my_est_save.ini_speed(:,3),estimateLineType,'markersize',markerSize, 'linewidth', linewidth);hold on;grid on;
plot(uavTruth.v_ned_mps(:,3),'r','markersize',markerSize, 'linewidth', linewidth);hold on;grid on; 
plot(my_est_save.est_v(:,3),estimateLineType,'markersize',markerSize, 'linewidth', linewidth);hold on;grid on; 
% Label figure
figure(gcf) % Bring figure to front
set(gcf,'name',sprintf('速度融合曲线 '));

% 
figure(6);
hold off;
% plot(my_est_save.kalman_y_v_est,estimateLineType,'markersize',markerSize, 'linewidth', linewidth);hold on;grid on;
plot(uavTruth.pitch_deg,'k','markersize',4, 'linewidth', 1.1);hold on;grid on;
plot(my_est_save.pith_lag,'r-+','markersize',6, 'linewidth', 1.1);hold on;grid on; 
plot(my_est_save.pith,'b-','markersize',4, 'linewidth', 1.1);hold on;grid on; 
% Label figure
grid on;
axis([1  30000 -20 30]);  %显示范围
legend('pith_{truth}','pith_{estlag}','pith_{estforward}');
set(gca, 'GridLineStyle', '--','FontName','Times New Roman','FontSize',16,'LineWidth',1);%网格类型
xlabel('time(100ms)','FontName','Times New Roman','FontSize',16)
ylabel('angle(degree)','FontName','Times New Roman','FontSize',16);
set(gca,'GridAlpha',0.9);

figure(gcf) % Bring figure to front
set(gcf,'name',sprintf('pith融合曲线 '));

figure(11);
hold off;
% 小的序列是旧值
[correlation_off_ini_acc, energe]= correlation_of_two_singnal(my_est_save.Acc_gps(2500:9000,2),my_est_save.Acc(2500:9000,2));
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
plot( my_est_save.energe1,estimateLineType,'markersize',markerSize, 'linewidth', linewidth);hold on;grid on; 
% Label figure
figure(gcf) % Bring figure to front
set(gcf,'name',sprintf('time1曲线 '));
figure(12);
hold off;
% plot(my_est_save.kalman_y_v_est,estimateLineType,'markersize',markerSize, 'linewidth', linewidth);hold on;grid on;
% plot(uavTruth.pitch_deg,'markersize',markerSize, 'linewidth', linewidth);hold on;grid on;
plot(my_est_save.delay_time2,estimateLineType,'markersize',markerSize, 'linewidth', linewidth);hold on;grid on; 
plot( my_est_save.energe2,estimateLineType,'markersize',markerSize, 'linewidth', linewidth);hold on;grid on; 
% Label figure
figure(gcf) % Bring figure to front
set(gcf,'name',sprintf('time2曲线 '));
figure(13);
hold off;
% plot(my_est_save.kalman_y_v_est,estimateLineType,'markersize',markerSize, 'linewidth', linewidth);hold on;grid on;
% plot(uavTruth.pitch_deg,'markersize',markerSize, 'linewidth', linewidth);hold on;grid on;
plot(my_est_save.delay_time3,estimateLineType,'markersize',markerSize, 'linewidth', linewidth);hold on;grid on; 
plot( my_est_save.energe3,estimateLineType,'markersize',markerSize, 'linewidth', linewidth);hold on;grid on; 
% Label figure
figure(gcf) % Bring figure to front
set(gcf,'name',sprintf('time3曲线 '));
figure(14);
hold off;
% plot(my_est_save.kalman_y_v_est,estimateLineType,'markersize',markerSize, 'linewidth', linewidth);hold on;grid on;
% plot(uavTruth.pitch_deg,'markersize',markerSize, 'linewidth', linewidth);hold on;grid on;
plot(my_est_save.Acc(:,1),'markersize',markerSize, 'linewidth', linewidth);hold on;grid on; 
plot(my_est_save.Acc_gps(:,1),'markersize',markerSize, 'linewidth', linewidth);hold on;grid on; 
% Label figure
figure(gcf) % Bring figure to front

set(gcf,'name',sprintf('1方向加速度比较'));
figure(15);
hold off;
% plot(my_est_save.kalman_y_v_est,estimateLineType,'markersize',markerSize, 'linewidth', linewidth);hold on;grid on;
% plot(uavTruth.pitch_deg,'markersize',markerSize, 'linewidth', linewidth);hold on;grid on;
plot(my_est_save.Acc(:,2),'markersize',markerSize, 'linewidth', linewidth);hold on;grid on; 
plot(my_est_save.Acc_gps(:,2),'markersize',markerSize, 'linewidth', linewidth);hold on;grid on; 
% Label figure
figure(gcf) % Bring figure to front
set(gcf,'name',sprintf('2方向加速度比较'));
figure(16);
hold off;
% plot(my_est_save.kalman_y_v_est,estimateLineType,'markersize',markerSize, 'linewidth', linewidth);hold on;grid on;
% plot(uavTruth.pitch_deg,'markersize',markerSize, 'linewidth', linewidth);hold on;grid on;
plot(my_est_save.Acc(:,3),'markersize',markerSize, 'linewidth', linewidth);hold on;grid on; 
plot(my_est_save.Acc_gps(:,3),'markersize',markerSize, 'linewidth', linewidth);hold on;grid on; 
% Label figure
figure(gcf) % Bring figure to front
set(gcf,'name',sprintf('3方向加速度比较'));

figure(17);
hold off;
% plot(my_est_save.kalman_y_v_est,estimateLineType,'markersize',markerSize, 'linewidth', linewidth);hold on;grid on;
% plot(uavTruth.pitch_deg,'markersize',markerSize, 'linewidth', linewidth);hold on;grid on;
plot(my_est_save.intergral_speed(:,1),'markersize',markerSize, 'linewidth', linewidth);hold on;grid on; 
plot(my_est_save.ini_speed(:,1),estimateLineType,'markersize',markerSize, 'linewidth', linewidth);hold on;grid on;
% plot(uavTruth.v_ned_mps(:,3),'r','markersize',markerSize, 'linewidth', linewidth);hold on;grid on; 
plot(my_est_save.est_v(:,1),estimateLineType,'markersize',markerSize, 'linewidth', linewidth);hold on;grid on; 
% Label figure
figure(gcf) % Bring figure to front
set(gcf,'name',sprintf('1方向速度比较'));


figure(18);
hold off;
% plot(my_est_save.kalman_y_v_est,estimateLineType,'markersize',markerSize, 'linewidth', linewidth);hold on;grid on;
% plot(uavTruth.pitch_deg,'markersize',markerSize, 'linewidth', linewidth);hold on;grid on;
plot(my_est_save.intergral_speed(:,2),'markersize',markerSize, 'linewidth', linewidth);hold on;grid on; 
plot(my_est_save.ini_speed(:,2),estimateLineType,'markersize',markerSize, 'linewidth', linewidth);hold on;grid on;
% plot(uavTruth.v_ned_mps(:,3),'r','markersize',markerSize, 'linewidth', linewidth);hold on;grid on; 
plot(my_est_save.est_v(:,2),estimateLineType,'markersize',markerSize, 'linewidth', linewidth);hold on;grid on; 
% Label figure
figure(gcf) % Bring figure to front
set(gcf,'name',sprintf('2方向速度比较'));


figure(19);
hold off;
% plot(my_est_save.kalman_y_v_est,estimateLineType,'markersize',markerSize, 'linewidth', linewidth);hold on;grid on;
% plot(uavTruth.pitch_deg,'markersize',markerSize, 'linewidth', linewidth);hold on;grid on;
plot(my_est_save.intergral_speed(:,3),'markersize',markerSize, 'linewidth', linewidth);hold on;grid on; 
plot(my_est_save.ini_speed(:,3),estimateLineType,'markersize',markerSize, 'linewidth', linewidth);hold on;grid on;
% plot(uavTruth.v_ned_mps(:,3),'r','markersize',markerSize, 'linewidth', linewidth);hold on;grid on; 
plot(my_est_save.est_v(:,3),estimateLineType,'markersize',markerSize, 'linewidth', linewidth);hold on;grid on; 
% Label figure
figure(gcf) % Bring figure to front
set(gcf,'name',sprintf('3方向速度比较'));



figure(20);
hold off;
plot3(uavTruth.east_m,uavTruth.north_m,uavTruth.h_msl_m, 'r*');hold on 
grid on
set(gca,'DataAspectRatio',[1 1 1]);
% Label figure
figure(gcf) % Bring figure to front
set(gcf,'name',sprintf('3D轨迹'));