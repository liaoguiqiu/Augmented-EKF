
%论文绘制总图
 
 
%时间估计
figure(1);
hold off;
 % Wrap from -180deg to 180deg.
% plot(my_est_save.kalman_y_v_est,estimateLineType,'markersize',markerSize, 'linewidth', linewidth);hold on;grid on;
plot(   my_est_save_well_time6_23 .right_delay_time(5000:40000),'r-','markersize',6, 'linewidth', 2);hold on;grid on;
plot(    my_est_save_well_time6_23 .delay_time1(5000:40000),'b-- ','markersize',6, 'linewidth', 1.5);hold on;grid on; 
plot(   my_est_save_well_time6_23 .delay_time2(5000:40000),'--','markersize',6, 'linewidth', 1.5);hold on;grid on; 
plot(   my_est_save_well_time6_23 .delay_time3(5000:40000),'--','markersize',6, 'linewidth', 1.5);hold on;grid on;
% Label figure
grid on;
% axis([1  30000 -50 50]);  %显示范围
lengend_size=legend('Fuse','X','Y','Z');
set(lengend_size,'Fontsize',20);
set(gca, 'GridLineStyle', '--','FontName','Times New Roman','FontSize',16,'LineWidth',1);%网格类型
xlabel('Time(10ms)','FontName','Times New Roman','FontSize',20)
ylabel('Time error(10ms)','FontName','Times New Roman','FontSize',20);
set(gca,'GridAlpha',0.9);
figure(gcf) % Bring figure to front
set(gcf,'name',sprintf('时间误差融合曲线'));

