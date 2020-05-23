function createfigure(YMatrix1, YMatrix2, YMatrix3)
%CREATEFIGURE(YMATRIX1, YMATRIX2, YMATRIX3)
%  YMATRIX1:  y 数据的矩阵
%  YMATRIX2:  y 数据的矩阵
%  YMATRIX3:  y 数据的矩阵

%  由 MATLAB 于 26-Jul-2017 11:34:46 自动生成

% 创建 figure
figure('Name','yaw融合曲线');

% 创建 subplot
subplot1 = subplot(3,1,1);
hold(subplot1,'on');

% 使用 plot 的矩阵输入创建多行
plot1 = plot(YMatrix1,'LineWidth',2,'Marker','.','LineStyle','--');
set(plot1(1),'DisplayName','pitch_{truth}','Color',[1 0 0],'Marker','none',...
    'LineStyle','-');
set(plot1(2),'DisplayName','pitch_{de-time-err}','Color',[0 0 1]);
set(plot1(3),'DisplayName','pitch_{with-time-err}','LineWidth',1.1,...
    'Color',[0 1 0]);

% 创建 xlabel
xlabel('Time(10ms)','FontName','Times New Roman');

% 创建 ylabel
ylabel('Pitch(degree)','FontName','Times New Roman');

% 取消以下行的注释以保留坐标轴的 X 范围
% xlim(subplot1,[10000 30000]);
% 取消以下行的注释以保留坐标轴的 Y 范围
% ylim(subplot1,[-20 30]);
box(subplot1,'on');
grid(subplot1,'on');
% 设置其余坐标轴属性
set(subplot1,'FontName','Times New Roman','FontSize',12,'GridAlpha',0.9,...
    'GridLineStyle','--','LineWidth',1);
% 创建 legend
legend1 = legend(subplot1,'show');
set(legend1,...
    'Position',[0.684382131347764 0.7792432721804 0.196944447782305 0.127334996623684],...
    'FontSize',12);

% 创建 subplot
subplot2 = subplot(3,1,2);
hold(subplot2,'on');

% 使用 plot 的矩阵输入创建多行
plot2 = plot(YMatrix2,'Marker','.','LineStyle','--');
set(plot2(1),'DisplayName','Roll_{truth}','LineWidth',3,'Color',[1 0 0],...
    'Marker','none',...
    'LineStyle','-');
set(plot2(2),'DisplayName','Roll_{de-time-err}','LineWidth',2,...
    'Color',[0 0 1]);
set(plot2(3),'DisplayName','Roll_{with-time-err}','LineWidth',1.1,...
    'Color',[0 1 0]);

% 创建 xlabel
xlabel('Time(10ms)','FontName','Times New Roman');

% 创建 ylabel
ylabel('Roll(degree)','FontName','Times New Roman');

% 取消以下行的注释以保留坐标轴的 X 范围
% xlim(subplot2,[10000 30000]);
% 取消以下行的注释以保留坐标轴的 Y 范围
% ylim(subplot2,[-30 40]);
box(subplot2,'on');
grid(subplot2,'on');
% 设置其余坐标轴属性
set(subplot2,'FontName','Times New Roman','FontSize',12,'GridAlpha',0.9,...
    'GridLineStyle','--','LineWidth',1);
% 创建 legend
legend2 = legend(subplot2,'show');
set(legend2,...
    'Position',[0.698587489900246 0.494374136112122 0.191388892094294 0.127334996623684],...
    'FontSize',12);

% 创建 subplot
subplot3 = subplot(3,1,3);
hold(subplot3,'on');

% 使用 plot 的矩阵输入创建多行
plot3 = plot(YMatrix3,'Marker','.');
set(plot3(1),'DisplayName','Yaw_{truth}','LineWidth',3,'Color',[1 0 0],...
    'Marker','none');
set(plot3(2),'DisplayName','Yaw_{de-time-err}','LineWidth',2,...
    'LineStyle','--',...
    'Color',[0 0 1]);
set(plot3(3),'DisplayName','Yaw_{with-time-err}','LineWidth',1.1,...
    'LineStyle','-.',...
    'Color',[0 1 0]);

% 创建 xlabel
xlabel('Time(10ms)','FontName','Times New Roman');

% 创建 ylabel
ylabel('Yaw(degree)','FontName','Times New Roman');

% 取消以下行的注释以保留坐标轴的 X 范围
% xlim(subplot3,[10000 30000]);
box(subplot3,'on');
grid(subplot3,'on');
% 设置其余坐标轴属性
set(subplot3,'FontName','Times New Roman','FontSize',12,'GridAlpha',0.9,...
    'GridLineStyle','--','LineWidth',1);
% 创建 legend
legend3 = legend(subplot3,'show');
set(legend3,...
    'Position',[0.68994416381749 0.205148754599471 0.194722225507101 0.127334996623684],...
    'FontSize',12);

