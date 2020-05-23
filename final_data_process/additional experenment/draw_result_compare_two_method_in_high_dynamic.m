% 6DOF estmation error
%--------the paper choose data for figure of time estimation of two method--------------%%
%----------------------%%
%-----Qiu choose and inport the datamat

%used to compare angle velocity
if ~ exist('uavestargumentKF')
load('uavest_argumentKF.mat');
end
if ~ exist('my_est_save_paper_method')
load('my_est_save_paper_method.mat');
end
if ~ exist('uavTruth_paper_method')
load('uavTruth_paper_method.mat');
end
if ~ exist('uavSensors_paper_method')
load('uavSensors_paper_method.mat');
end
if ~ exist('uavSensors_arguKF')
load('uavSensors_arguKF.mat');
end


%used to compare the time
if ~ exist('uavest_argu_0_20')
load('uavest_argumentKF_0_20.mat');   %my method results
end
if ~ exist('my_est_save_nice_time')
load('my_est_save_nice_time.mat');   %my method results
end


LENG = length(my_est_save_paper_method.pith);
firstpoint =10000; 
endpoint = LENG;
figure(1)
hold off;
% figure for the angle compare
plot(   uavTruth_paper_method.pitch_deg(firstpoint:10:endpoint),'r-','markersize',6, 'linewidth', 3);hold on;grid on;
plot(   my_est_save_paper_method.pith(firstpoint:10:endpoint ),'b--. ','markersize',6, 'linewidth', 2.1);hold on;grid on; 
plot(   uavestargumentKF.pitch_deg(firstpoint:10:endpoint ),  'g-- ','markersize',6, 'linewidth', 3);hold on;grid on; 
% Label figure
grid on;
% axis([1  30000 -50 50]);  %显示范围
lengend_size=legend('Model','Proposed method','Previous method');
set(lengend_size,'Fontsize',20);
set(gca, 'GridLineStyle', '--','FontName','Times New Roman','FontSize',16,'LineWidth',1);%网格类型
xlabel('Time(s)','FontName','Times New Roman','FontSize',20)
ylabel('Pitch(degree)','FontName','Times New Roman','FontSize',20);
set(gca,'GridAlpha',0.9);
figure(gcf) % Bring figure to front
set(gcf,'name',sprintf('CMpare of angle'));

figure(2)
hold off;
hold off;
% figure for the angle compare
plot( 0.2* ones( 1 , length(firstpoint:10:endpoint)),'r--','markersize',6, 'linewidth', 3);hold on;grid on;
plot(   uavest_argu_0_20.time_err(20000:10:endpoint ),  'g-- ','markersize',6, 'linewidth', 3);hold on;grid on; 
plot(  0.01* my_est_save_nice_time.right_delay_time(33880:6:endpoint ),'markersize',6, 'linewidth', 2.1);hold on;grid on; 

% Label figure
grid on;
% axis([1  30000 -50 50]);  %显示范围
lengend_size=legend('Model','Proposed method','Previous method');
set(lengend_size,'Fontsize',20);
set(gca, 'GridLineStyle', '--','FontName','Times New Roman','FontSize',16,'LineWidth',1);%网格类型
xlabel('Time(s)','FontName','Times New Roman','FontSize',20)
ylabel('Pitch(degree)','FontName','Times New Roman','FontSize',20);
set(gca,'GridAlpha',0.9);
figure(gcf) % Bring figure to front
set(gcf,'name',sprintf('CMpare of time'));

figure(3)
hold off;
% figure for the angle compare
err1 = my_est_save_paper_method.pith  -uavTruth_paper_method.pitch_deg; 
err2 = uavestargumentKF.pitch_deg  -uavTruth_paper_method.pitch_deg; 
plot(  err1(1:1:endpoint ),'b--. ','markersize',6, 'linewidth', 2.1);hold on;grid on; 
plot(  err2(1:1:endpoint ),  'g-- ','markersize',6, 'linewidth', 3);hold on;grid on; 
% Label figure
grid on;
% axis([1  30000 -50 50]);  %显示范围
lengend_size=legend('Proposed method','Previous method');
set(lengend_size,'Fontsize',20);
set(gca, 'GridLineStyle', '--','FontName','Times New Roman','FontSize',16,'LineWidth',1);%网格类型
xlabel('Time(s)','FontName','Times New Roman','FontSize',20)
ylabel('Attitude error(degree)','FontName','Times New Roman','FontSize',20);
set(gca,'GridAlpha',0.9);
figure(gcf) % Bring figure to front
set(gcf,'name',sprintf('CMpare of angle err'));


figure(4) 
hold off;
%put together
subplot(3,1,1)
hold off;
% figure for the angle compare
plot(   uavTruth_paper_method.pitch_deg(20000:10:endpoint),'r-','markersize',6, 'linewidth', 3);hold on;grid on;
plot(   my_est_save_paper_method.pith(20000:10:endpoint ),'b--. ','markersize',6, 'linewidth', 2.1);hold on;grid on; 
plot(   uavestargumentKF.pitch_deg(20000:10:endpoint ),  'g-- ','markersize',6, 'linewidth', 3);hold on;grid on; 
% Label figure
grid on;
% axis([1  30000 -50 50]);  %显示范围
lengend_size=legend('Model','Proposed method','Previous method');
set(lengend_size,'Fontsize',12);
set(gca, 'GridLineStyle', '--','FontName','Times New Roman','FontSize',12,'LineWidth',1);%网格类型
xlabel('Time(s)','FontName','Times New Roman','FontSize',12)
ylabel('Pitch(degree)','FontName','Times New Roman','FontSize',12);
set(gca,'GridAlpha',0.9);
figure(gcf) % Bring figure to front
set(gcf,'name',sprintf('CMpare of angle'));
subplot(3,1,2)
hold off;
% figure for the angle compare
plot( 0.2* ones( 1 , length(20000:10:endpoint)),'r--','markersize',6, 'linewidth', 3);hold on;grid on;
plot(   uavest_argu_0_20.time_err(20000:10:endpoint ),  'g--. ','markersize',6, 'linewidth', 3);hold on;grid on; 
plot(  0.01* my_est_save_nice_time.right_delay_time(33880:5:endpoint ),'--. ','markersize',6, 'linewidth', 2.1);hold on;grid on; 
% Label figure
grid on;
% axis([1  30000 -50 50]);  %显示范围
lengend_size=legend('Model','Previous method','Proposed method');
set(lengend_size,'Fontsize',12);
set(gca, 'GridLineStyle', '--','FontName','Times New Roman','FontSize',12,'LineWidth',1);%网格类型
xlabel('Time(s)','FontName','Times New Roman','FontSize',12)
ylabel('Time sychronization error(s)','FontName','Times New Roman','FontSize',12);
set(gca,'GridAlpha',0.9);
figure(gcf) % Bring figure to front
set(gcf,'name',sprintf('CMpare of time'));
subplot(3,1,3)

% figure for the angle compare
err1 = my_est_save_paper_method.pith  -uavTruth_paper_method.pitch_deg; 
err2 = uavestargumentKF.pitch_deg  -uavTruth_paper_method.pitch_deg; 
plot(  err1(20000:1:endpoint ),'b--. ','markersize',6, 'linewidth', 2.1);hold on;grid on; 
plot(  err2(20000:1:endpoint ),  'g-- ','markersize',6, 'linewidth', 3);hold on;grid on; 
% Label figure
grid on;
% axis([1  30000 -50 50]);  %显示范围
lengend_size=legend('Proposed method','Previous method');
set(lengend_size,'Fontsize',12);
set(gca, 'GridLineStyle', '--','FontName','Times New Roman','FontSize',12,'LineWidth',1);%网格类型
xlabel('Time(s)','FontName','Times New Roman','FontSize',12)
ylabel('Attitude estimation error(degree)','FontName','Times New Roman','FontSize',12);
set(gca,'GridAlpha',0.9);
figure(gcf) % Bring figure to front
set(gcf,'name',sprintf('CMpare of angle err'));





