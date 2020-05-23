
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
plot3(uavEst.east_m, uavEst.north_m, uavEst.h_msl_m,'markersize',markerSize, 'linewidth', linewidth);hold on;grid on; 
figure(gcf) % Bring figure to front
set(gcf,'name',sprintf('3D¹ì¼£'));
