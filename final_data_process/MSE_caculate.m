% 6DOF estmation error
%--------the paper choose data for figure of time estimation of two method--------------%%
%----------------------%%
%-----Qiu choose and inport the datamat
if ~ exist('uavEst_well_result')
load('UavData_LetterE_estmat_well_result_lag_uavEst.mat');   %my method results
end
if ~ exist('my_est_save_well_result')
load('UavData_LetterE_estmat_well_result_lag_my_est_save.mat');
end
%Qiu choose and inport the datamat
if ~ exist('uavTruth')
load('my_uav_truth.mat');        %initial method results
end
if ~ exist('uavsensor_well_acc_b')
load('UavData_LetterE_uavsensor_well_acc_b.mat'); 
end
if ~ exist('uavsensor_well_gyro_b')
load('UavData_LetterE_uavsensor_well_gyro_b.mat'); 
end
if ~ exist('my_est_save_well_gyro_b')
load('UavData_LetterE_my_est_save_well_gyro_b.mat'); 
end
if ~ exist('my_est_save_well_acc_b')
load('UavData_LetterE_my_est_save_well_acc_b.mat'); 
end
if ~ exist('uavEst_well_acc_b')
load('UavData_LetterE_uavEst_well_acc_b.mat'); 
end
if ~ exist('uavEst_well_gyro_b')
load('UavData_LetterE_uavEst_well_gyro_b.mat'); 
end
%----- import data finishment



LENG = length (uavEst_well_result.pitch_deg)
figure(1)
subplot(3,1,1)
hold off;
 % Wrap from -180deg to 180deg.
% plot(my_est_save.kalman_y_v_est,estimateLineType,'markersize',markerSize, 'linewidth', linewidth);hold on;grid on;
wrap = @(angleDeg)(mod(angleDeg+180,360)-180);
first_point = 1;
plot(uavEst_well_result.pitch_deg(first_point:10:LENG)-uavTruth.pitch_deg(first_point:10:LENG),'r','markersize',6, 'linewidth', 2);hold on;grid on;
plot(uavEst_well_result.roll_deg(first_point:10:LENG)-uavTruth.roll_deg(first_point:10:LENG),'b','markersize',6, 'linewidth', 2);hold on;grid on;
error = uavEst_well_result.yaw_deg -uavTruth.yaw_deg ;
for i=1:length(error)
  if(error(i)<(-180))
      error(i)= error(i)+ 360;
  end
end 
%MSE caculate 
angle_er1 = uavEst_well_result.pitch_deg(20000:LENG)-uavTruth.pitch_deg(20000:LENG);
angle_er2 = uavEst_well_result.roll_deg(20000:LENG)-uavTruth.roll_deg(20000:LENG);
angle_er3 = error(20000:LENG);
pit_mse = mse_caculate(angle_er1)
roll_mse = mse_caculate(angle_er2)
yaw_mse = mse_caculate(angle_er3)
plot(error(first_point:10:LENG),'markersize',6, 'linewidth', 2);hold on;grid on;
% Label figure
 axis([1  4000 -10 10]);  %ÏÔÊ¾·¶Î§
lengend_size=legend('Pitch','Roll','Yaw' );
set(lengend_size,'Fontsize',12);
set(gca, 'GridLineStyle', '--','FontName','Times New Roman','FontSize',12,'LineWidth',1);%Íø¸ñÀàÐÍ
xlabel('Time(0.1)','FontName','Times New Roman','FontSize',12)
ylabel('Attitude error(degree)','FontName','Times New Roman','FontSize',12);
set(gca,'GridAlpha',0.9);
figure(gcf) % Bring figure to front
set(gcf,'name',sprintf('½Ç¶ÈÎó²îÇúÏß '));

subplot(3,1,2)
hold off;
 % Wrap from -180deg to 180deg.
% plot(my_est_save.kalman_y_v_est,estimateLineType,'markersize',markerSize, 'linewidth', linewidth);hold on;grid on;
error = my_est_save_well_result.ad_speed  -  uavTruth.v_ned_mps;
%MSE caculate 
er1 = error(20000:LENG,1);
er2 = error(20000:LENG,2);
er3 = error(20000:LENG,3);
vx_mse = mse_caculate(er1)
vy_mse = mse_caculate(er2)
vz_mse = mse_caculate(er3)
plot(error(first_point:10:LENG,1),'r','markersize',6, 'linewidth', 2);hold on;grid on;
plot(error(first_point:10:LENG,2),'b','markersize',6, 'linewidth', 2);hold on;grid on;
plot(error(first_point:10:LENG,3),'markersize',6, 'linewidth', 2);hold on;grid on;
% Label figure
 axis([1  4000 -5 5]);  %ÏÔÊ¾·¶Î§
lengend_size=legend('East','North','Height' );
set(lengend_size,'Fontsize',12);
set(gca, 'GridLineStyle', '--','FontName','Times New Roman','FontSize',12,'LineWidth',1);%Íø¸ñÀàÐÍ
xlabel('Time(0.1s)','FontName','Times New Roman','FontSize',12)
ylabel('Speed error(m/s)','FontName','Times New Roman','FontSize',12);
set(gca,'GridAlpha',0.9);
figure(gcf) % Bring figure to front
set(gcf,'name',sprintf('ËÙ¶È¶ÈÎó²îÇúÏß '));
 
subplot(3,1,3)
  hold off;
 % Wrap from -180deg to 180deg.
% plot(my_est_save.kalman_y_v_est,estimateLineType,'markersize',markerSize, 'linewidth', linewidth);hold on;grid on;
%  my_est_save_well_result.ad_pos  -  uavTruth.v_ned_mps;
plot( my_est_save_well_result.ad_pos(first_point:10:LENG,1)- uavTruth.north_m (first_point:10:LENG,1),'r','markersize',6, 'linewidth', 2);hold on;grid on;
plot(my_est_save_well_result.ad_pos(first_point:10:LENG,2)- uavTruth.east_m(first_point:10:LENG,1),'b','markersize',6, 'linewidth', 2);hold on;grid on;
plot(my_est_save_well_result.ad_pos(first_point:10:LENG,3)- uavTruth.h_msl_m(first_point:10:LENG,1),'markersize',6, 'linewidth', 2);hold on;grid on;
%MSE caculate 
er1 =my_est_save_well_result.ad_pos(20000:10:LENG,1)- uavTruth.north_m (20000:10:LENG,1);
er2 =my_est_save_well_result.ad_pos(20000:10:LENG,2)- uavTruth.east_m(20000:10:LENG,1);
er3 =my_est_save_well_result.ad_pos(20000:10:LENG,3)- uavTruth.h_msl_m(20000:10:LENG,1);
px_mse = mse_caculate(er1)
py_mse = mse_caculate(er2)
pz_mse = mse_caculate(er3)
% Label figure
  axis([1  4000 -4 4]);  %ÏÔÊ¾·¶Î§
lengend_size=legend('East','North','Height' );
set(lengend_size,'Fontsize',12);
set(gca, 'GridLineStyle', '--','FontName','Times New Roman','FontSize',12,'LineWidth',1);%Íø¸ñÀàÐÍ
xlabel('Time(10ms)','FontName','Times New Roman','FontSize',12)
ylabel('Position error(m)','FontName','Times New Roman','FontSize',12);
set(gca,'GridAlpha',0.9);
figure(gcf) % Bring figure to front
set(gcf,'name',sprintf('Æ¯ÒÆÎó²îÇúÏß '));
 

% ´«¸ÐÆ÷Æ«²î¹À¼Æ
figure(2)
subplot(2,1,1)

%ÍÓÂÝÒÆÆ¯ÒÆÎó²î
LENG  = length( uavEst_well_gyro_b.xhat(:,1) );
firstpoint = 1; 
hold off;
% Wrap from -180deg to 180deg.
% plot(my_est_save.kalman_y_v_est,estimateLineType,'markersize',markerSize, 'linewidth', linewidth);hold on;grid on;
%  my_est_save_well_result.ad_pos  -  uavTruth.v_ned_mps;
  truths = ones(size(uavTruth.time_s))*[uavsensor_well_gyro_b.biases.gyro_wb_rps]; % kx3
  estimates = uavEst_well_gyro_b.xhat(:,[uavEst_well_gyro_b.states.bwx uavEst_well_gyro_b.states.bwy uavEst_well_gyro_b.states.bwz]);
 error = estimates  -  truths;
 er1 = error(20000:LENG,1);
er2 = error(20000:LENG,2);
er3 = error(20000:LENG,3);
bgx_mse = mse_caculate(er1)
bgy_mse = mse_caculate(er2)
byz_mse = mse_caculate(er3)
plot(error(firstpoint:10:LENG,1),'r','markersize',6, 'linewidth', 2);hold on;grid on;
plot(error(firstpoint:10:LENG,2),'b','markersize',6, 'linewidth', 2);hold on;grid on;
plot(error(firstpoint:10:LENG,3),'markersize',6, 'linewidth', 2);hold on;grid on;
% Label figure
 axis([1  4000 -0.045 0.1]);  %ÏÔÊ¾·¶Î§
lengend_size=legend('g_{x}','g_{y}','g_{z}' );
set(lengend_size,'Fontsize',12);
set(gca, 'GridLineStyle', '--','FontName','Times New Roman','FontSize',12,'LineWidth',1);%Íø¸ñÀàÐÍ
xlabel('Time(0.1s)','FontName','Times New Roman','FontSize',12)
ylabel('Gyro bias error(rad/s)','FontName','Times New Roman','FontSize',12);
set(gca,'GridAlpha',0.9);
figure(gcf) % Bring figure to front
set(gcf,'name',sprintf('ÍÓÂÝÎó²îÎó²îÇúÏß '));
%¼ÓËÙ¶ÈÒÆÆ¯ÒÆÎó²î
subplot(2,1,2)
hold off;
 % Wrap from -180deg to 180deg.
% plot(my_est_save.kalman_y_v_est,estimateLineType,'markersize',markerSize, 'linewidth', linewidth);hold on;grid on;
%  my_est_save_well_result.ad_pos  -  uavTruth.v_ned_mps;
  truths = ones(size(uavTruth.time_s))*[uavsensor_well_acc_b.biases.accel_fb_mps2]; % kx3
  estimates = uavEst_well_acc_b.xhat(:,[uavEst_well_acc_b.states.bax uavEst_well_acc_b.states.bay uavEst_well_acc_b.states.baz]);

 error = estimates  -  truths;
  er1 = error(20000:LENG,1);
er2 = error(20000:LENG,2);
er3 = error(20000:LENG,3);
bax_mse = mse_caculate(er1)
bay_mse = mse_caculate(er2)
baz_mse = mse_caculate(er3)
plot(error(firstpoint:10:LENG,1),'r','markersize',6, 'linewidth', 2);hold on;grid on;
plot(error(firstpoint:10:LENG,2),'b','markersize',6, 'linewidth', 2);hold on;grid on;
plot(error(firstpoint:10:LENG,3),'markersize',6, 'linewidth', 2);hold on;grid on;
% Label figure
  axis([1  4000 -0.6 1]);  %ÏÔÊ¾·¶Î§
lengend_size=legend('a_{x}','a_{y}','a_{z}' );
set(lengend_size,'Fontsize',12);
set(gca, 'GridLineStyle', '--','FontName','Times New Roman','FontSize',12,'LineWidth',1);%Íø¸ñÀàÐÍ
xlabel('Time(0.1s)','FontName','Times New Roman','FontSize',12)
ylabel('Acc bias error(g)','FontName','Times New Roman','FontSize',12);
set(gca,'GridAlpha',0.9);
figure(gcf) % Bring figure to front
set(gcf,'name',sprintf('¼ÓËÙ¶ÈÎó²îÇúÏß '));


function [out] = mse_caculate(in)
  L = length (in);
  out  = sum(in.^2)/L;
  out = sqrt(out);
end





