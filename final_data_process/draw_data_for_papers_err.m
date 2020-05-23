
%论文绘制总图
 
 
%角度误差
figure(4);
hold off;
 % Wrap from -180deg to 180deg.
% plot(my_est_save.kalman_y_v_est,estimateLineType,'markersize',markerSize, 'linewidth', linewidth);hold on;grid on;
wrap = @(angleDeg)(mod(angleDeg+180,360)-180);
first_point = 1;
plot(uavEst_well_result.pitch_deg(first_point:25000)-uavTruth.pitch_deg(first_point:25000),'r','markersize',6, 'linewidth', 2);hold on;grid on;
plot(uavEst_well_result.roll_deg(first_point:25000)-uavTruth.roll_deg(first_point:25000),'b','markersize',6, 'linewidth', 2);hold on;grid on;
error = uavEst.yaw_deg-uavTruth.yaw_deg;
for i=1:length(error)
  if(error(i)<(-180))
      error(i)= error(i)+ 360;
  end
end 
plot(error(first_point:25000),'markersize',6, 'linewidth', 2);hold on;grid on;
% Label figure
 
%  axis([1  10000 -5 5]);  %显示范围
lengend_size=legend('pitch error','Roll error','Yaw error' );
set(lengend_size,'Fontsize',20);
set(gca, 'GridLineStyle', '--','FontName','Times New Roman','FontSize',16,'LineWidth',1);%网格类型
xlabel('Time(10ms)','FontName','Times New Roman','FontSize',20)
ylabel('Angle(degree)','FontName','Times New Roman','FontSize',20);
set(gca,'GridAlpha',0.9);
figure(gcf) % Bring figure to front
set(gcf,'name',sprintf('角度误差曲线 '));
  

%速度误差误差
figure(5);
hold off;
 % Wrap from -180deg to 180deg.
% plot(my_est_save.kalman_y_v_est,estimateLineType,'markersize',markerSize, 'linewidth', linewidth);hold on;grid on;
 
 error = my_est_save_well_result.ad_speed  -  uavTruth.v_ned_mps;
plot(error(:,1),'r','markersize',6, 'linewidth', 2);hold on;grid on;
plot(error(:,2),'b','markersize',6, 'linewidth', 2);hold on;grid on;
plot(error(:,3),'markersize',6, 'linewidth', 2);hold on;grid on;
% Label figure
 
%  axis([1  10000 -5 5]);  %显示范围
lengend_size=legend('East speed error','North speed error','High speed error' );
set(lengend_size,'Fontsize',20);
set(gca, 'GridLineStyle', '--','FontName','Times New Roman','FontSize',16,'LineWidth',1);%网格类型
xlabel('Time(10ms)','FontName','Times New Roman','FontSize',20)
ylabel('Speed error(m/s)','FontName','Times New Roman','FontSize',20);
set(gca,'GridAlpha',0.9);
figure(gcf) % Bring figure to front
set(gcf,'name',sprintf('速度度误差曲线 '));
 



%位置误差误差
figure(6);
hold off;
 % Wrap from -180deg to 180deg.
% plot(my_est_save.kalman_y_v_est,estimateLineType,'markersize',markerSize, 'linewidth', linewidth);hold on;grid on;
%  my_est_save_well_result.ad_pos  -  uavTruth.v_ned_mps;
plot( my_est_save_well_result.ad_pos(:,1)- uavTruth.north_m ,'r','markersize',6, 'linewidth', 2);hold on;grid on;
plot(my_est_save_well_result.ad_pos(:,2)- uavTruth.east_m,'b','markersize',6, 'linewidth', 2);hold on;grid on;
plot(my_est_save_well_result.ad_pos(:,3)- uavTruth.h_msl_m,'markersize',6, 'linewidth', 2);hold on;grid on;
 
% Label figure
%  axis([1  10000 -5 5]);  %显示范围
lengend_size=legend('East positon error','North position error','High position error' );
set(lengend_size,'Fontsize',20);
set(gca, 'GridLineStyle', '--','FontName','Times New Roman','FontSize',16,'LineWidth',1);%网格类型
xlabel('Time(10ms)','FontName','Times New Roman','FontSize',20)
ylabel('Position error(m)','FontName','Times New Roman','FontSize',20);
set(gca,'GridAlpha',0.9);
figure(gcf) % Bring figure to front
set(gcf,'name',sprintf('漂移误差曲线 '));
 


%陀螺移漂移误差
figure(7);
hold off;
 % Wrap from -180deg to 180deg.
% plot(my_est_save.kalman_y_v_est,estimateLineType,'markersize',markerSize, 'linewidth', linewidth);hold on;grid on;
%  my_est_save_well_result.ad_pos  -  uavTruth.v_ned_mps;
  truths = ones(size(uavTruth.time_s))*[uavsensor_well_gyro_b.biases.gyro_wb_rps]; % kx3
  estimates = uavEst_well_gyro_b.xhat(:,[uavEst_well_gyro_b.states.bwx uavEst_well_gyro_b.states.bwy uavEst_well_gyro_b.states.bwz]);

 error = estimates  -  truths;
plot(error(:,1),'r','markersize',6, 'linewidth', 2);hold on;grid on;
plot(error(:,2),'b','markersize',6, 'linewidth', 2);hold on;grid on;
plot(error(:,3),'markersize',6, 'linewidth', 2);hold on;grid on;
% Label figure
%  axis([1  10000 -5 5]);  %显示范围
lengend_size=legend('Bias error_{gx}','Bias error_{gy}','Bias error_{gz}' );
set(lengend_size,'Fontsize',20);
set(gca, 'GridLineStyle', '--','FontName','Times New Roman','FontSize',16,'LineWidth',1);%网格类型
xlabel('Time(10ms)','FontName','Times New Roman','FontSize',20)
ylabel('Gyro bias error(degree/s)','FontName','Times New Roman','FontSize',20);
set(gca,'GridAlpha',0.9);
figure(gcf) % Bring figure to front
set(gcf,'name',sprintf('陀螺误差误差曲线 '));



%加速度移漂移误差
figure(8);
hold off;
 % Wrap from -180deg to 180deg.
% plot(my_est_save.kalman_y_v_est,estimateLineType,'markersize',markerSize, 'linewidth', linewidth);hold on;grid on;
%  my_est_save_well_result.ad_pos  -  uavTruth.v_ned_mps;
  truths = ones(size(uavTruth.time_s))*[uavsensor_well_acc_b.biases.accel_fb_mps2]; % kx3
  estimates = uavEst_well_acc_b.xhat(:,[uavEst_well_acc_b.states.bax uavEst.states.bay uavEst.states.baz]);

 error = estimates  -  truths;
plot(error(:,1),'r','markersize',6, 'linewidth', 2);hold on;grid on;
plot(error(:,2),'b','markersize',6, 'linewidth', 2);hold on;grid on;
plot(error(:,3),'markersize',6, 'linewidth', 2);hold on;grid on;
% Label figure
%  axis([1  10000 -5 5]);  %显示范围
lengend_size=legend('Bias error_{ax}','Bias error_{ay}','Bias error_{az}' );
set(lengend_size,'Fontsize',20);
set(gca, 'GridLineStyle', '--','FontName','Times New Roman','FontSize',16,'LineWidth',1);%网格类型
xlabel('Time(10ms)','FontName','Times New Roman','FontSize',20)
ylabel('Acc bias error(g)','FontName','Times New Roman','FontSize',20);
set(gca,'GridAlpha',0.9);
figure(gcf) % Bring figure to front
set(gcf,'name',sprintf('加速度误差曲线 '));

