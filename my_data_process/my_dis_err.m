truthLineType    = '-';
estimateLineType = '-.';
markerSize       = 7;
linewidth        = 2;
 
% 
figure(7);
hold off;
% plot(my_est_save.kalman_y_v_est,estimateLineType,'markersize',markerSize, 'linewidth', linewidth);hold on;grid on;
plot(my_est_save.pith-uavTruth.pitch_deg,'markersize',markerSize, 'linewidth', linewidth);hold on;grid on;
% plot(my_est_save.pith_lag,estimateLineType,'markersize',markerSize, 'linewidth', linewidth);hold on;grid on; 
% plot(my_est_save.pith.-,estimateLineType,'markersize',markerSize, 'linewidth', linewidth);hold on;grid on; 
% Label figure
figure(gcf) % Bring figure to front
set(gcf,'name',sprintf('pitherr曲线 '));

% 
figure(8);
hold off;
plot(my_est_save.ad_speed(:,3)-uavTruth.v_ned_mps(:,3),estimateLineType,'markersize',markerSize, 'linewidth', linewidth);hold on;grid on;
% plot(my_est_save.ini_speed(:,3),estimateLineType,'markersize',markerSize, 'linewidth', linewidth);hold on;grid on;
% plot(uavTruth.v_ned_mps(:,3),'r','markersize',markerSize, 'linewidth', linewidth);hold on;grid on; 
% plot(my_est_save.est_v(:,3),estimateLineType,'markersize',markerSize, 'linewidth', linewidth);hold on;grid on; 
% Label figure
figure(gcf) % Bring figure to front
set(gcf,'name',sprintf('速度err曲线 '));
