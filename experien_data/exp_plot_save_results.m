 addpath G:\kalman_study\suas_code_v1\SUAS_Code\my_data_process 

truthLineType    = '-';
estimateLineType = '-.';
markerSize       = 7;
linewidth        = 2;
    
figure(10);
hold off;
% plot(my_est_save.kalman_y_v_est,estimateLineType,'markersize',markerSize, 'linewidth', linewidth);hold on;grid on;
plot(my_est_save_initial_delay .right_delay_time(500:4265),'r-','markersize',1.5, 'linewidth', 1.5);hold on;grid on;
plot(my_est_save_initial_delay.delay_time1(500:4265),estimateLineType,'markersize',2, 'linewidth', 2);hold on;grid on; 
plot(my_est_save_add_delay.right_delay_time(500:4265),'markersize',1.5, 'linewidth', 1.5);hold on;grid on;
plot(my_est_save_add_delay.delay_time1(500:4265),estimateLineType,'markersize',2, 'linewidth', 2);hold on;grid on;

lengend_size=legend('fusion without additional delay ','one axis without additional delay','fusion with additional delay ','one axis with additional delay');
set(lengend_size,'Fontsize',12);
set(gca, 'GridLineStyle', '--','FontName','Times New Roman','FontSize',12,'LineWidth',1);%网格类型
xlabel('Time(100ms)','FontName','Times New Roman','FontSize',12)
ylabel('Time synchronization error(10ms)','FontName','Times New Roman','FontSize',12);
set(gca,'GridAlpha',0.9);
figure(gcf) % Bring figure to front
set(gcf,'name',sprintf('延时估计曲线 '));