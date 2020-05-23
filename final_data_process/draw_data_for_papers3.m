
%论文绘制总图

%北向速度比较
figure(4);
hold off;
 % Wrap from -180deg to 180deg.
% plot(my_est_save.kalman_y_v_est,estimateLineType,'markersize',markerSize, 'linewidth', linewidth);hold on;grid on;
plot(   uavTruth.v_ned_mps(:,1),'r-','markersize',6, 'linewidth', 3);hold on;grid on;
plot(   my_est_save_well_result.ad_speed(:,1),'b. ','markersize',6, 'linewidth', 1.1);hold on;grid on; 
plot(   my_est_save_200ms_lag.ad_speed(:,1),  'g. ','markersize',6, 'linewidth', 1.1);hold on;grid on; 
plot(   my_est_save_well_result.ini_speed(:,1),'k.','markersize',6, 'linewidth', 1);hold on;grid on;
% Label figure
grid on;
% axis([1  30000 -50 50]);  %显示范围
lengend_size=legend('Vn_{truth}','Vn_{de-time-err}','Vn_{with-time-err}','Vn_{GPS}');
set(lengend_size,'Fontsize',20);
set(gca, 'GridLineStyle', '--','FontName','Times New Roman','FontSize',16,'LineWidth',1);%网格类型
xlabel('Time(10ms)','FontName','Times New Roman','FontSize',20)
ylabel('Vn(m/s)','FontName','Times New Roman','FontSize',20);
set(gca,'GridAlpha',0.9);
figure(gcf) % Bring figure to front
set(gcf,'name',sprintf('北向速度融合曲线 '));


%东向速度比较
figure(5);
hold off;
 % Wrap from -180deg to 180deg.
% plot(my_est_save.kalman_y_v_est,estimateLineType,'markersize',markerSize, 'linewidth', linewidth);hold on;grid on;
plot(   uavTruth.v_ned_mps(:,2),'r-','markersize',6, 'linewidth', 3);hold on;grid on;
plot(   my_est_save_well_result.ad_speed(:,2),'b. ','markersize',6, 'linewidth', 1.1);hold on;grid on; 
plot(   my_est_save_200ms_lag.ad_speed(:,2),  'g. ','markersize',6, 'linewidth', 1.1);hold on;grid on; 
plot(   my_est_save_well_result.ini_speed(:,2),'k.','markersize',6, 'linewidth', 1);hold on;grid on;
% Label figure
grid on;
% axis([1  30000 -50 50]);  %显示范围
lengend_size=legend('Ve_{truth}','Ve_{de-time-err}','Ve_{with-time-err}','Ve_{GPS}');
set(lengend_size,'Fontsize',20);
set(gca, 'GridLineStyle', '--','FontName','Times New Roman','FontSize',16,'LineWidth',1);%网格类型
xlabel('Time(10ms)','FontName','Times New Roman','FontSize',20)
ylabel('Ve(m/s)','FontName','Times New Roman','FontSize',20);
set(gca,'GridAlpha',0.9);
figure(gcf) % Bring figure to front
set(gcf,'name',sprintf('东向速度融合曲线 '));

% 东向位置比较
figure(6);
hold off;
 % Wrap from -180deg to 180deg.
% plot(my_est_save.kalman_y_v_est,estimateLineType,'markersize',markerSize, 'linewidth', linewidth);hold on;grid on;
plot(   uavTruth.north_m ,'r-','markersize',6, 'linewidth', 3);hold on;grid on;
plot(   my_est_save_well_result.ad_pos(:,1),'b. ','markersize',6, 'linewidth', 1.1);hold on;grid on; 
plot(   my_est_save_200ms_lag.ad_pos(:,1),  'g. ','markersize',6, 'linewidth', 1.1);hold on;grid on; 
plot(   my_est_save_well_result.ini_potion(:,1),'.','markersize',6, 'linewidth', 1);hold on;grid on;
% Label figure
grid on;
% axis([1  30000 -50 50]);  %显示范围
lengend_size=legend('Pe_{truth}','Pe_{de-time-err}','Pe_{with-time-err}','Pe_{GPS}');
set(lengend_size,'Fontsize',20);
set(gca, 'GridLineStyle', '--','FontName','Times New Roman','FontSize',16,'LineWidth',1);%网格类型
xlabel('Time(10ms)','FontName','Times New Roman','FontSize',20)
ylabel('Pe(m/s)','FontName','Times New Roman','FontSize',20);
set(gca,'GridAlpha',0.9);
figure(gcf) % Bring figure to front
set(gcf,'name',sprintf('东向位置融合曲线 '));


% 北向位置比较
figure(7);
hold off;
 % Wrap from -180deg to 180deg.
% plot(my_est_save.kalman_y_v_est,estimateLineType,'markersize',markerSize, 'linewidth', linewidth);hold on;grid on;
plot(   uavTruth.east_m ,'r-','markersize',6, 'linewidth', 3);hold on;grid on;
plot(   my_est_save_well_result.ad_pos(:,2),'b. ','markersize',6, 'linewidth', 1.1);hold on;grid on; 
plot(   my_est_save_200ms_lag.ad_pos(:,2),  'g. ','markersize',6, 'linewidth', 1.1);hold on;grid on; 
plot(   my_est_save_well_result.ini_potion(:,2),'.','markersize',6, 'linewidth', 1);hold on;grid on;
% Label figure
grid on;
% axis([1  30000 -50 50]);  %显示范围
lengend_size=legend('Pn_{truth}','Pn_{de-time-err}','Pn_{with-time-err}','Pn_{GPS}');
set(lengend_size,'Fontsize',20);
set(gca, 'GridLineStyle', '--','FontName','Times New Roman','FontSize',16,'LineWidth',1);%网格类型
xlabel('Time(10ms)','FontName','Times New Roman','FontSize',20)
ylabel('Pn(m/s)','FontName','Times New Roman','FontSize',20);
set(gca,'GridAlpha',0.9);
figure(gcf) % Bring figure to front
set(gcf,'name',sprintf('北向位置融合曲线 '));


% 高度比较
figure(7);
hold off;
 % Wrap from -180deg to 180deg.
% plot(my_est_save.kalman_y_v_est,estimateLineType,'markersize',markerSize, 'linewidth', linewidth);hold on;grid on;
plot(   uavTruth.h_msl_m ,'r-','markersize',6, 'linewidth', 3);hold on;grid on;
plot(   my_est_save_well_result.ad_pos(:,3),'b. ','markersize',6, 'linewidth', 1.1);hold on;grid on; 
plot(   my_est_save_200ms_lag.ad_pos(:,3),  'g. ','markersize',6, 'linewidth', 1.1);hold on;grid on; 
plot(   my_est_save_well_result.ini_potion(:,3),'.','markersize',6, 'linewidth', 1);hold on;grid on;
% Label figure
grid on;
% axis([1  30000 -50 50]);  %显示范围
lengend_size=legend('H_{truth}','H_{de-time-err}','H_{with-time-err}','H_{GPS}');
set(lengend_size,'Fontsize',20);
set(gca, 'GridLineStyle', '--','FontName','Times New Roman','FontSize',16,'LineWidth',1);%网格类型
xlabel('Time(10ms)','FontName','Times New Roman','FontSize',20)
ylabel('H(m/s)','FontName','Times New Roman','FontSize',20);
set(gca,'GridAlpha',0.9);
figure(gcf) % Bring figure to front
set(gcf,'name',sprintf('北向位置融合曲线 '));




