if ~exist('Angle_PIT')
  experienment_fuse_result;
end
 
figure(1);
subplot(3,1,1)
hold off;
 % Wrap from -180deg to 180deg.
% plot(my_est_save.kalman_y_v_est,estimateLineType,'markersize',markerSize, 'linewidth', linewidth);hold on;grid on;
plot(   vb_f_x_DATA1(2700:3800),'r-','markersize',6, 'linewidth', 2);hold on;grid on;
plot(   v_b_l_x_DATA4(2700:3800),'b- ','markersize',6, 'linewidth', 1.5);hold on;grid on; 
 plot(   gpsvx_b_DATA18(2700:3800),'- ','markersize',6, 'linewidth', 1.5);hold on;grid on; 
% Label figure
grid on;
%  axis([1  3000 -20 22]);  %显示范围
lengend_size=legend('Fuse forward','Fuse lag','GPS','Vn_{GPS}');
set(lengend_size,'Fontsize',12);
set(gca, 'GridLineStyle', '--','FontName','Times New Roman','FontSize',12,'LineWidth',1);%网格类型
xlabel('Time(40ms)','FontName','Times New Roman','FontSize',12)
ylabel('Vn(mm/s)','FontName','Times New Roman','FontSize',12);
set(gca,'GridAlpha',0.9);
figure(gcf) % Bring figure to front
set(gcf,'name',sprintf('速度度融合曲线 '));


%东向速度比较
subplot(3,1,2)
hold off;
% plot(my_est_save.kalman_y_v_est,estimateLineType,'markersize',markerSize, 'linewidth', linewidth);hold on;grid on;
plot(   vb_f_y_DATA2(2700:3800),'r-','markersize',6, 'linewidth', 2);hold on;grid on;
plot(   v_b_l_y_DATA5(2700:3800),'b- ','markersize',6, 'linewidth', 1.5);hold on;grid on; 
 plot(   gpsvy_b_DATA19(2700:3800),'- ','markersize',6, 'linewidth', 1.5);hold on;grid on; 
% Label figure
grid on;
%  axis([1  3000 -20 22]);  %显示范围
lengend_size=legend('Fuse forward','Fuse lag','GPS','Vn_{GPS}');
set(lengend_size,'Fontsize',12);
set(gca, 'GridLineStyle', '--','FontName','Times New Roman','FontSize',12,'LineWidth',1);%网格类型
xlabel('Time(40ms)','FontName','Times New Roman','FontSize',12)
ylabel('Ve(mm/s)','FontName','Times New Roman','FontSize',12);
set(gca,'GridAlpha',0.9);
figure(gcf) % Bring figure to front
set(gcf,'name',sprintf('速度度融合曲线 '));


% 高度方向速度比较
subplot(3,1,3)
hold off;
% plot(my_est_save.kalman_y_v_est,estimateLineType,'markersize',markerSize, 'linewidth', linewidth);hold on;grid on;
plot(   vb_f_z_DATA3(2700:3800),'r-','markersize',6, 'linewidth', 2);hold on;grid on;
plot(   v_b_l_z_DATA6(2700:3800),'b- ','markersize',6, 'linewidth', 1.5);hold on;grid on; 
 plot(   gpsvz_DATA15(2700:3800),'- ','markersize',6, 'linewidth', 1.5);hold on;grid on; 
% Label figure
grid on;
%  axis([1  3000 -20 22]);  %显示范围
lengend_size=legend('Fuse forward','Fuse lag','GPS','Vn_{GPS}');
set(lengend_size,'Fontsize',12);
set(gca, 'GridLineStyle', '--','FontName','Times New Roman','FontSize',12,'LineWidth',1);%网格类型
xlabel('Time(40ms)','FontName','Times New Roman','FontSize',12)
ylabel('Vd(mm/s)','FontName','Times New Roman','FontSize',12);
set(gca,'GridAlpha',0.9);
figure(gcf) % Bring figure to front
set(gcf,'name',sprintf('速度度融合曲线 '));



