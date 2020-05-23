function createfigure_9_9(YMatrix1)
%CREATEFIGURE(YMatrix1)
%  YMATRIX1:  y 数据的矩阵

%  由 MATLAB 于 14-Jan-2019 10:05:33 自动生成

% 创建 figure
figure1 = figure;

% 创建 axes
axes1 = axes('Parent',figure1);
hold(axes1,'on');

% 使用 plot 的矩阵输入创建多行
plot1 = plot(YMatrix1,'MarkerSize',4,'Marker','.');
set(plot1(1),'DisplayName','Proposed Method','Color',[0 0 1]);
set(plot1(2),'DisplayName','EKF with delay','Color',[1 0 0]);

% 创建 ylabel
ylabel('Pitch Error(Deg)','FontSize',11,'FontName','Times New Roman');

% 创建 xlabel
xlabel('T(s)','FontSize',11,'FontName','Times New Roman');

% 取消以下行的注释以保留坐标区的 X 范围
xlim(axes1,[0 3000]);
set(axes1,'XTickLabel',{'0','5','10','15','20','25','30'});
box(axes1,'on');
grid(axes1,'on');
% 创建 legend
legend1 = legend(axes1,'show');
set(legend1,'FontSize',11);

