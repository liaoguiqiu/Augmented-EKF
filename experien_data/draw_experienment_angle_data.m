if ~exist('Angle_PIT')
  angle_experiment_copmpare;
end
 
figure(1);
subplot(3,1,1)
hold off;
 % Wrap from -180deg to 180deg.
% plot(my_est_save.kalman_y_v_est,estimateLineType,'markersize',markerSize, 'linewidth', linewidth);hold on;grid on;
plot(   Angle_PIT,'r-','markersize',6, 'linewidth', 2);hold on;grid on;
plot(   pit_dcm,'b- ','markersize',6, 'linewidth', 1.5);hold on;grid on; 
 
% Label figure
grid on;
 axis([1  3000 -20 22]);  %显示范围
lengend_size=legend('AHRS-GPS','AHRS','Vn_{with-time-err}','Vn_{GPS}');
set(lengend_size,'Fontsize',12);
set(gca, 'GridLineStyle', '--','FontName','Times New Roman','FontSize',12,'LineWidth',1);%网格类型
xlabel('Time(40ms)','FontName','Times New Roman','FontSize',12)
ylabel('Pitch(degree)','FontName','Times New Roman','FontSize',12);
set(gca,'GridAlpha',0.9);
figure(gcf) % Bring figure to front
set(gcf,'name',sprintf('角度融合曲线 '));


%东向速度比较
subplot(3,1,2)
hold off;
 % plot(my_est_save.kalman_y_v_est,estimateLineType,'markersize',markerSize, 'linewidth', linewidth);hold on;grid on;
plot(   Angle_ROL,'r-','markersize',6, 'linewidth', 2);hold on;grid on;
plot(   roll_dcm,'b- ','markersize',6, 'linewidth', 1.5);hold on;grid on; 
 
% Label figure
grid on;
axis([1  3000 -20 20]);  %显示范围
lengend_size=legend('AHRS-GPS','AHRS','Vn_{with-time-err}','Vn_{GPS}');
set(lengend_size,'Fontsize',12);
set(gca, 'GridLineStyle', '--','FontName','Times New Roman','FontSize',12,'LineWidth',1);%网格类型
xlabel('Time(40ms)','FontName','Times New Roman','FontSize',12)
ylabel('Roll(degree)','FontName','Times New Roman','FontSize',12);
set(gca,'GridAlpha',0.9);
figure(gcf) % Bring figure to front
set(gcf,'name',sprintf('角度融合曲线 '));


% 高度方向速度比较
subplot(3,1,3)
hold off;
% plot(my_est_save.kalman_y_v_est,estimateLineType,'markersize',markerSize, 'linewidth', linewidth);hold on;grid on;
plot(   Angle_YAW,'r-','markersize',6, 'linewidth', 2);hold on;grid on;
plot(   yaw_dcm,'b- ','markersize',6, 'linewidth', 1.5);hold on;grid on; 
 
% Label figure
grid on;
 axis([1  3000 -40 40]);  %显示范围
lengend_size=legend('AHRS-GPS','AHRS','Vn_{with-time-err}','Vn_{GPS}');
set(lengend_size,'Fontsize',12);
set(gca, 'GridLineStyle', '--','FontName','Times New Roman','FontSize',12,'LineWidth',1);%网格类型
xlabel('Time(40ms)','FontName','Times New Roman','FontSize',12)
ylabel('Yaw(degree)','FontName','Times New Roman','FontSize',12);
set(gca,'GridAlpha',0.9);
figure(gcf) % Bring figure to front
set(gcf,'name',sprintf('角度融合曲线 '));



