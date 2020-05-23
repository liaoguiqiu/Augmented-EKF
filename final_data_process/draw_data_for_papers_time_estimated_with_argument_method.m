%--------the paper choose data for figure of time estimation of two method--------------%%
%----------------------%%
%-----Qiu choose and inport the datamat
if ~ exist('my_est_save_well_time6_23')
load('UavData_LetterE_my_est_save_well_time6_23.mat');   %my method results
end
%Qiu choose and inport the datamat
if ~ exist('uavEst_time_by_argument_filter_state')
load('uavEst_time_by_argument_filter_state.mat');        %initial method results
end
% 传感器偏差估计
figure(1)
subplot(2,1,1)
%时间估计
LENG  = length( my_est_save_well_time6_23.delay_time1 );
firstpoint = 7000; 
hold off;
% Wrap from -180deg to 180deg.
% plot(my_est_save.kalman_y_v_est,estimateLineType,'markersize',markerSize, 'linewidth', linewidth);hold on;grid on;
%  my_est_save_well_result.ad_pos  -  uavTruth.v_ned_mps;
% plot(my_est_save_well_time6_23.delay_time1(firstpoint:10:LENG),'r--.','markersize',6, 'linewidth', 1);hold on;grid on;
% plot(my_est_save_well_time6_23.delay_time2(firstpoint:10:LENG),'g--.','markersize',6, 'linewidth', 1);hold on;grid on;
% plot(my_est_save_well_time6_23.delay_time3(firstpoint:10:LENG),'b--.','markersize',6, 'linewidth', 1);hold on;grid on;
plot(100*uavEst_time_by_argument_filter_state.time_err(1:10:LENG - firstpoint),'b--.','markersize',6, 'linewidth', 1);hold on;grid on;
plot(ones( 1 , length(firstpoint:10:LENG))*20,'r--','markersize',6, 'linewidth', 2);hold on;grid on;
plot(my_est_save_well_time6_23.right_delay_time(firstpoint:10:LENG),'markersize',6, 'linewidth', 2);hold on;grid on;

% Label figure
 axis([1  3200 -42 50]);  %显示范围
lengend_size=legend('Argumented EKF','Model','Proposed method'  );
set(lengend_size,'Fontsize',12);
set(gca, 'GridLineStyle', '--','FontName','Times New Roman','FontSize',12,'LineWidth',1);%网格类型
xlabel('Time( s)','FontName','Times New Roman','FontSize',12)
ylabel('Time synchronization error( s)','FontName','Times New Roman','FontSize',12);
set(gca,'GridAlpha',0.9);
figure(gcf) % Bring figure to front
set(gcf,'name',sprintf('陀螺误差误差曲线 '));
%三个方向的置信度
subplot(2,1,2)
hold off;
 % Wrap from -180deg to 180deg.
% plot(my_est_save.kalman_y_v_est,estimateLineType,'markersize',markerSize, 'linewidth', linewidth);hold on;grid on;
%  my_est_save_well_result.ad_pos  -  uavTruth.v_ned_mps;
  
plot(my_est_save_well_time6_23.energe1(firstpoint:10:LENG)/4,'r','markersize',6, 'linewidth', 2);hold on;grid on;
plot(my_est_save_well_time6_23.energe2(firstpoint:10:LENG)/3.1,'b','markersize',6, 'linewidth', 2);hold on;grid on;
plot(my_est_save_well_time6_23.energe3(firstpoint:10:LENG)/3/0.6,'markersize',6, 'linewidth', 2);hold on;grid on;
% Label figure
  axis([1  3200 0 1]);  %显示范围
lengend_size=legend('X axis','Y axis','Z axis' );
set(lengend_size,'Fontsize',12);
set(gca, 'GridLineStyle', '--','FontName','Times New Roman','FontSize',12,'LineWidth',1);%网格类型
xlabel('Time(s)','FontName','Times New Roman','FontSize',12)
ylabel('Confidence coefficient of accelerations','FontName','Times New Roman','FontSize',12);
set(gca,'GridAlpha',0.9);
figure(gcf) % Bring figure to front
set(gcf,'name',sprintf('加速度误差曲线 '));





