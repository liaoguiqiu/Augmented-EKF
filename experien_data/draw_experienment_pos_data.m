if ~exist('Angle_PIT')
  experienment_fuse_result;
end
 start = 1;
 last = 1500 ;
 data_buff =zeros(1,9);
      dt_s = 0.04;
      
 
 
figure(1);
subplot(3,1,1)
hold off;
 % Wrap from -180deg to 180deg.
% plot(my_est_save.kalman_y_v_est,estimateLineType,'markersize',markerSize, 'linewidth', linewidth);hold on;grid on;
plot(   vb_f_x_DATA1(start:last)/1000,'r-','markersize',4, 'linewidth', 2);hold on;grid on;
plot(   v_b_l_x_DATA4(start:last)/1000,'b- ','markersize',4, 'linewidth', 1.5);hold on;grid on; 
 plot(   gpsvx_b_DATA18(start:last)/1000,'x ','markersize',4, 'linewidth', 1.5);hold on;grid on; 
% Label figure
grid on;
%  axis([1  3000 -20 22]);  %显示范围
lengend_size=legend('Fuse forward','Fuse lag','GPS','Pn_{GPS}');
set(lengend_size,'Fontsize',12);
set(gca, 'GridLineStyle', '--','FontName','Times New Roman','FontSize',12,'LineWidth',1);%网格类型
xlabel('Time(40ms)','FontName','Times New Roman','FontSize',12)
ylabel('Pn(mm/s)','FontName','Times New Roman','FontSize',12);
set(gca,'GridAlpha',0.9);
figure(gcf) % Bring figure to front
set(gcf,'name',sprintf('速度度融合曲线 '));


%东向速度比较
subplot(3,1,2)
hold off;
% plot(my_est_save.kalman_y_v_est,estimateLineType,'markersize',markerSize, 'linewidth', linewidth);hold on;grid on;
plot(   vb_f_y_DATA2(start:last)/1000,'r-','markersize',4, 'linewidth', 2);hold on;grid on;
plot(   v_b_l_y_DATA5(start:last)/1000,'b- ','markersize',4, 'linewidth', 1.5);hold on;grid on; 
 plot(   gpsvy_b_DATA19(start:last)/1000,'x ','markersize',4, 'linewidth', 1.5);hold on;grid on; 
% Label figure
grid on;
%  axis([1  3000 -20 22]);  %显示范围
lengend_size=legend('Fuse forward','Fuse lag','GPS','Pn_{GPS}');
set(lengend_size,'Fontsize',12);
set(gca, 'GridLineStyle', '--','FontName','Times New Roman','FontSize',12,'LineWidth',1);%网格类型
xlabel('Time(40ms)','FontName','Times New Roman','FontSize',12)
ylabel('Pe(mm/s)','FontName','Times New Roman','FontSize',12);
set(gca,'GridAlpha',0.9);
figure(gcf) % Bring figure to front
set(gcf,'name',sprintf('速度度融合曲线 '));


% 高度方向速度比较
subplot(3,1,3)
hold off;
start = start+1000;
last  = last +1000;
% plot(my_est_save.kalman_y_v_est,estimateLineType,'markersize',markerSize, 'linewidth', linewidth);hold on;grid on;
plot(   vb_f_x_DATA1(start:last)/1000,'r-','markersize',4, 'linewidth', 2);hold on;grid on;
plot(   v_b_l_x_DATA4(start:last)/1000,'b- ','markersize',4, 'linewidth', 1.5);hold on;grid on; 
 plot(   gpsvx_b_DATA18(start:last)/1000,'x ','markersize',4, 'linewidth', 1.5);hold on;grid on;
% Label figure
grid on;
%  axis([1  3000 -20 22]);  %显示范围
lengend_size=legend('Fuse forward','Fuse lag','GPS','Pn_{GPS}');
set(lengend_size,'Fontsize',12);
set(gca, 'GridLineStyle', '--','FontName','Times New Roman','FontSize',12,'LineWidth',1);%网格类型
xlabel('Time(40ms)','FontName','Times New Roman','FontSize',12)
ylabel('Pz(mm/s)','FontName','Times New Roman','FontSize',12);
set(gca,'GridAlpha',0.9);
figure(gcf) % Bring figure to front
set(gcf,'name',sprintf('速度度融合曲线 '));



