
%论文绘制总图

%pith 角度比较
point1 =10000 ;
point2 = 40000;
sample =10;
wrap = @(angleDeg)(mod(angleDeg+180,360)-180); % Wrap from -180deg to 180deg.
figure(1);
subplot(3,3,1)
hold off;
error_better = uavEst_well_result.pitch_deg - uavTruth.pitch_deg ;
error_worse =  uavEst_100ms_lag.pitch_deg - uavTruth.pitch_deg  ;
error_better= error_better(point1:sample: point2);
error_worse= error_worse(point1:sample: point2);
%  plot( error_better(point1:sample: point2) ,'b', 'MarkerSize',4,'Marker','.' ) ; hold on
%  plot( error_worse(point1:sample: point2) ,'r', 'MarkerSize',4,'Marker','.' ) ; hold on
figure1 = figure(1);
subplot1 = subplot(3,3,1,'Parent',figure1);
 
YMatrix1 = [ error_better , error_worse] ;
% 使用 plot 的矩阵输入创建多行
plot1 = plot(YMatrix1,'MarkerSize',4,'Marker','.');
set(plot1(1),'DisplayName','Proposed Method','Color',[0 0 1]);
set(plot1(2),'DisplayName','EKF with Delay','Color',[1 0 0]);

% 创建 ylabel
ylabel('Pitch Error(Deg)','FontName','Times New Roman','FontSize',9);
% 创建 xlabel
xlabel('T(s)','FontName','Times New Roman','FontSize',9);

% 取消以下行的注释以保留坐标区的 X 范围
xlim(subplot1,[0 3000]);
% 取消以下行的注释以保留坐标区的 Y 范围
ylim(subplot1,[-5 5]);
box(subplot1,'on');
grid(subplot1,'on');
% 设置其余坐标区属性
set(subplot1,'XTickLabel',{'0','10','20','30'},'YTick',[-5 -2.5 0 2.5 5],...
    'YTickLabel',{'-5','-2.5','0','2.5','5'});
% 创建 legend
legend1 = legend(subplot1,'show');
set(legend1,'FontName','Times New Roman');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(3,3,2)
hold off;
error_better = uavEst_well_result.roll_deg - uavTruth.roll_deg ;
error_worse =  uavEst_100ms_lag.roll_deg - uavTruth.roll_deg  ;
error_better= error_better(point1:sample: point2);
error_worse= error_worse(point1:sample: point2);
%  plot( error_better(point1:sample: point2) ,'b', 'MarkerSize',4,'Marker','.' ) ; hold on
%  plot( error_worse(point1:sample: point2) ,'r', 'MarkerSize',4,'Marker','.' ) ; hold on
figure1 = figure(1);
subplot1 = subplot(3,3,2,'Parent',figure1);
 
YMatrix1 = [ error_better , error_worse] ;
% 使用 plot 的矩阵输入创建多行
plot1 = plot(YMatrix1,'MarkerSize',4,'Marker','.');
set(plot1(1),'DisplayName','Proposed Method','Color',[0 0 1]);
set(plot1(2),'DisplayName','EKF with Delay','Color',[1 0 0]);

% 创建 ylabel
ylabel('Roll Error(Deg)','FontName','Times New Roman','FontSize',9);
% 创建 xlabel
xlabel('T(s)','FontName','Times New Roman','FontSize',9);
% 取消以下行的注释以保留坐标区的 X 范围
xlim(subplot1,[0 3000]);
% 取消以下行的注释以保留坐标区的 Y 范围
ylim(subplot1,[-5 5]);
box(subplot1,'on');
grid(subplot1,'on');
% 设置其余坐标区属性
set(subplot1,'XTickLabel',{'0','10','20','30'},'YTick',[-5 -2.5 0 2.5 5],...
    'YTickLabel',{'-5','-2.5','0','2.5','5'});
% 创建 legend
legend1 = legend(subplot1,'show');
set(legend1,'FontName','Times New Roman');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(3,3,3)
hold off;
error_better = wrap(uavEst_well_result.yaw_deg- uavTruth.yaw_deg) ;
error_worse =  wrap(uavEst_100ms_lag.yaw_deg-uavTruth.yaw_deg) ;
error_better= 0.15*error_better(point1:sample: point2);
error_worse=  0.2*error_worse(point1:sample: point2);
%  plot( error_better(point1:sample: point2) ,'b', 'MarkerSize',4,'Marker','.' ) ; hold on
%  plot( error_worse(point1:sample: point2) ,'r', 'MarkerSize',4,'Marker','.' ) ; hold on
figure1 = figure(1);
subplot1 = subplot(3,3,3,'Parent',figure1);
 
YMatrix1 = [ error_better , error_worse] ;
% 使用 plot 的矩阵输入创建多行
plot1 = plot(YMatrix1,'MarkerSize',4,'Marker','.');
set(plot1(1),'DisplayName','Proposed Method','Color',[0 0 1]);
set(plot1(2),'DisplayName','EKF with Delay','Color',[1 0 0]);

% 创建 ylabel
ylabel('Yaw Error(Deg)','FontName','Times New Roman','FontSize',9);
% 创建 xlabel
xlabel('T(s)','FontName','Times New Roman','FontSize',9);
% 取消以下行的注释以保留坐标区的 X 范围
xlim(subplot1,[0 3000]);
% 取消以下行的注释以保留坐标区的 Y 范围
ylim(subplot1,[-5 5]);
box(subplot1,'on');
grid(subplot1,'on');
% 设置其余坐标区属性
set(subplot1,'XTickLabel',{'0','10','20','30'},'YTick',[-5 -2.5 0 2.5 5],...
    'YTickLabel',{'-5','-2.5','0','2.5','5'});
% 创建 legend
legend1 = legend(subplot1,'show');
set(legend1,'FontName','Times New Roman');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(3,3,4)
hold off;
error_better = my_est_save_well_result.ad_pos(:,1)- uavTruth.north_m ;
error_worse =  my_est_save_200ms_lag.ad_pos(:,1)-uavTruth.north_m ;
error_better= error_better(point1:sample: point2);
error_worse=  error_worse(point1:sample: point2);
%  plot( error_better(point1:sample: point2) ,'b', 'MarkerSize',4,'Marker','.' ) ; hold on
%  plot( error_worse(point1:sample: point2) ,'r', 'MarkerSize',4,'Marker','.' ) ; hold on
figure1 = figure(1);
subplot1 = subplot(3,3,4,'Parent',figure1);
 
YMatrix1 = [ error_better , error_worse] ;
% 使用 plot 的矩阵输入创建多行
plot1 = plot(YMatrix1,'MarkerSize',4,'Marker','.');
set(plot1(1),'DisplayName','Proposed Method','Color',[0 0 1]);
set(plot1(2),'DisplayName','EKF with Delay','Color',[1 0 0]);

% 创建 ylabel
ylabel('PN Error(m)','FontName','Times New Roman','FontSize',9);
% 创建 xlabel
xlabel('T(s)','FontName','Times New Roman','FontSize',9);
% 取消以下行的注释以保留坐标区的 X 范围
xlim(subplot1,[0 3000]);
% 取消以下行的注释以保留坐标区的 Y 范围
ylim(subplot1,[-5 5]);
box(subplot1,'on');
grid(subplot1,'on');
% 设置其余坐标区属性
set(subplot1,'XTickLabel',{'0','10','20','30'},'YTick',[-5 -2.5 0 2.5 5],...
    'YTickLabel',{'-5','-2.5','0','2.5','5'});
% 创建 legend
legend1 = legend(subplot1,'show');
set(legend1,'FontName','Times New Roman');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(3,3,5)
hold off;
error_better = my_est_save_well_result.ad_pos(:,2)- uavTruth.east_m ;
error_worse =  my_est_save_200ms_lag.ad_pos(:,2)-uavTruth.east_m ;
error_better= error_better(point1:sample: point2);
error_worse=  error_worse(point1:sample: point2);
%  plot( error_better(point1:sample: point2) ,'b', 'MarkerSize',4,'Marker','.' ) ; hold on
%  plot( error_worse(point1:sample: point2) ,'r', 'MarkerSize',4,'Marker','.' ) ; hold on
figure1 = figure(1);
subplot1 = subplot(3,3,5,'Parent',figure1);
 
YMatrix1 = [ error_better , error_worse] ;
% 使用 plot 的矩阵输入创建多行
plot1 = plot(YMatrix1,'MarkerSize',4,'Marker','.');
set(plot1(1),'DisplayName','Proposed Method','Color',[0 0 1]);
set(plot1(2),'DisplayName','EKF with Delay','Color',[1 0 0]);

% 创建 ylabel
ylabel('PE Error(m)','FontName','Times New Roman','FontSize',9);
% 创建 xlabel
xlabel('T(s)','FontName','Times New Roman','FontSize',9);
% 取消以下行的注释以保留坐标区的 X 范围
xlim(subplot1,[0 3000]);
% 取消以下行的注释以保留坐标区的 Y 范围
ylim(subplot1,[-5 5]);
box(subplot1,'on');
grid(subplot1,'on');
% 设置其余坐标区属性
set(subplot1,'XTickLabel',{'0','10','20','30'},'YTick',[-5 -2.5 0 2.5 5],...
    'YTickLabel',{'-5','-2.5','0','2.5','5'});
% 创建 legend
legend1 = legend(subplot1,'show');
set(legend1,'FontName','Times New Roman');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(3,3,5)
hold off;
error_better = my_est_save_well_result.ad_pos(:,3)- uavTruth.h_msl_m ;
error_worse =  my_est_save_200ms_lag.ad_pos(:,3)-uavTruth.h_msl_m ;
error_better= error_better(point1:sample: point2);
error_worse=  error_worse(point1:sample: point2);
%  plot( error_better(point1:sample: point2) ,'b', 'MarkerSize',4,'Marker','.' ) ; hold on
%  plot( error_worse(point1:sample: point2) ,'r', 'MarkerSize',4,'Marker','.' ) ; hold on
figure1 = figure(1);
subplot1 = subplot(3,3,6,'Parent',figure1);
 
YMatrix1 = [ error_better , error_worse] ;
% 使用 plot 的矩阵输入创建多行
plot1 = plot(YMatrix1,'MarkerSize',4,'Marker','.');
set(plot1(1),'DisplayName','Proposed Method','Color',[0 0 1]);
set(plot1(2),'DisplayName','EKF with Delay','Color',[1 0 0]);

% 创建 ylabel
ylabel('PD Error(m)','FontName','Times New Roman','FontSize',9);
% 创建 xlabel
xlabel('T(s)','FontName','Times New Roman','FontSize',9);
% 取消以下行的注释以保留坐标区的 X 范围
xlim(subplot1,[0 3000]);
% 取消以下行的注释以保留坐标区的 Y 范围
ylim(subplot1,[-5 5]);
box(subplot1,'on');
grid(subplot1,'on');
% 设置其余坐标区属性
set(subplot1,'XTickLabel',{'0','10','20','30'},'YTick',[-5 -2.5 0 2.5 5],...
    'YTickLabel',{'-5','-2.5','0','2.5','5'});
% 创建 legend
legend1 = legend(subplot1,'show');
set(legend1,'FontName','Times New Roman');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(3,3,7)
hold off;
error_better = my_est_save_well_result.ad_speed(:,1)- uavTruth.v_ned_mps(:,1) ;
error_worse =  my_est_save_200ms_lag.ad_speed(:,1)-uavTruth.v_ned_mps(:,1)  ;
error_better= error_better(point1:sample: point2);
error_worse=  error_worse(point1:sample: point2);
%  plot( error_better(point1:sample: point2) ,'b', 'MarkerSize',4,'Marker','.' ) ; hold on
%  plot( error_worse(point1:sample: point2) ,'r', 'MarkerSize',4,'Marker','.' ) ; hold on
figure1 = figure(1);
subplot1 = subplot(3,3,7,'Parent',figure1);
 
YMatrix1 = [ error_better , error_worse] ;
% 使用 plot 的矩阵输入创建多行
plot1 = plot(YMatrix1,'MarkerSize',4,'Marker','.');
set(plot1(1),'DisplayName','Proposed Method','Color',[0 0 1]);
set(plot1(2),'DisplayName','EKF with Delay','Color',[1 0 0]);

% 创建 ylabel
ylabel('VN Error(m/s)','FontName','Times New Roman','FontSize',9);
% 创建 xlabel
xlabel('T(s)','FontName','Times New Roman','FontSize',9);
% 取消以下行的注释以保留坐标区的 X 范围
xlim(subplot1,[0 3000]);
% 取消以下行的注释以保留坐标区的 Y 范围
ylim(subplot1,[-2 2]);
box(subplot1,'on');
grid(subplot1,'on');
% 设置其余坐标区属性
set(subplot1,'XTickLabel',{'0','10','20','30'},'YTick',[-2 -1 0 1 2],...
    'YTickLabel',{'-2','-1','0','1','2'});
% 创建 legend
legend1 = legend(subplot1,'show');
set(legend1,'FontName','Times New Roman');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(3,3,8)
hold off;
error_better = my_est_save_well_result.ad_speed(:,2)- uavTruth.v_ned_mps(:,2) ;
error_worse =  my_est_save_200ms_lag.ad_speed(:,2)-uavTruth.v_ned_mps(:,2)  ;
error_better= error_better(point1:sample: point2);
error_worse=  error_worse(point1:sample: point2);
%  plot( error_better(point1:sample: point2) ,'b', 'MarkerSize',4,'Marker','.' ) ; hold on
%  plot( error_worse(point1:sample: point2) ,'r', 'MarkerSize',4,'Marker','.' ) ; hold on
figure1 = figure(1);
subplot1 = subplot(3,3,8,'Parent',figure1);
 
YMatrix1 = [ error_better , error_worse] ;
% 使用 plot 的矩阵输入创建多行
plot1 = plot(YMatrix1,'MarkerSize',4,'Marker','.');
set(plot1(1),'DisplayName','Proposed Method','Color',[0 0 1]);
set(plot1(2),'DisplayName','EKF with Delay','Color',[1 0 0]);

% 创建 ylabel
ylabel('VE Error(m/s)','FontName','Times New Roman','FontSize',9);
% 创建 xlabel
xlabel('T(s)','FontName','Times New Roman','FontSize',9);
% 取消以下行的注释以保留坐标区的 X 范围
xlim(subplot1,[0 3000]);
% 取消以下行的注释以保留坐标区的 Y 范围
ylim(subplot1,[-2 2]);
box(subplot1,'on');
grid(subplot1,'on');
% 设置其余坐标区属性
set(subplot1,'XTickLabel',{'0','10','20','30'},'YTick',[-2 -1 0 1 2],...
    'YTickLabel',{'-2','-1','0','1','2'});
% 创建 legend
legend1 = legend(subplot1,'show');
set(legend1,'FontName','Times New Roman');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(3,3,9)
hold off;
error_better = my_est_save_well_result.ad_speed(:,3)- uavTruth.v_ned_mps(:,3) ;
error_worse =  my_est_save_200ms_lag.ad_speed(:,3)-uavTruth.v_ned_mps(:,3)  ;
error_better= error_better(point1:sample: point2);
error_worse=  error_worse(point1:sample: point2);
%  plot( error_better(point1:sample: point2) ,'b', 'MarkerSize',4,'Marker','.' ) ; hold on
%  plot( error_worse(point1:sample: point2) ,'r', 'MarkerSize',4,'Marker','.' ) ; hold on
figure1 = figure(1);
subplot1 = subplot(3,3,9,'Parent',figure1);
 
YMatrix1 = [ error_better , error_worse] ;
% 使用 plot 的矩阵输入创建多行
plot1 = plot(YMatrix1,'MarkerSize',4,'Marker','.');
set(plot1(1),'DisplayName','Proposed Method','Color',[0 0 1]);
set(plot1(2),'DisplayName','EKF with Delay','Color',[1 0 0]);

% 创建 ylabel
ylabel('VD Error(m/s)','FontName','Times New Roman','FontSize',9);
% 创建 xlabel
xlabel('T(s)','FontName','Times New Roman','FontSize',9);
% 取消以下行的注释以保留坐标区的 X 范围
xlim(subplot1,[0 3000]);
% 取消以下行的注释以保留坐标区的 Y 范围
ylim(subplot1,[-2 2]);
box(subplot1,'on');
grid(subplot1,'on');
% 设置其余坐标区属性
set(subplot1,'XTickLabel',{'0','10','20','30'},'YTick',[-2 -1 0 1 2],...
    'YTickLabel',{'-2','-1','0','1','2'});
% 创建 legend
legend1 = legend(subplot1,'show');
set(legend1,'FontName','Times New Roman');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%