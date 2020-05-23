
truthLineType    = '-';
estimateLineType = '-.';
markerSize       = 7;
linewidth        = 2;
figure(19);

hold off;
% plot(my_est_save.kalman_y_v_est,estimateLineType,'markersize',markerSize, 'linewidth', linewidth);hold on;grid on;
% plot(uavTruth.pitch_deg,'markersize',markerSize, 'linewidth', linewidth);hold on;grid on;
% plot3(uavSensors.GPS_east_m,uavSensors.GPS_north_m,uavSensors.GPS_h_msl_m,'markersize',markerSize, 'linewidth', linewidth);hold on;grid on; 
%  
plot3(uavEst.east_m, uavEst.north_m, uavEst.h_msl_m,'r--','markersize',markerSize, 'linewidth', linewidth);hold on;grid on; 
plot3(test.east_m, test.north_m, test.h_msl_m,'b-','markersize',markerSize, 'linewidth', linewidth);hold on;grid on;
legend('trajectory_{GPS}','trajectory_{est}');
set(gca, 'GridLineStyle', '--','FontName','Times New Roman','FontSize',16,'LineWidth',1);%Õ¯∏Ò¿‡–Õ
 
set(gca,'GridAlpha',0.9);
figure(gcf) % Bring figure to front
set(gcf,'name',sprintf('3DπÏº£'));
