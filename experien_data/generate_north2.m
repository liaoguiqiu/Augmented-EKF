%% 导入文本文件中的数据。
% 用于从以下文本文件导入数据的脚本:
%
%    G:\kalman_study\suas_code_v1\SUAS_Code\experien_data\up_down.csv
%
% 要将代码扩展到其他选定数据或其他文本文件，请生成函数来代替脚本。

% 由 MATLAB 自动生成于 2017/04/12 10:03:45

%% 初始化变量。
filename = 'G:\kalman_study\suas_code_v1\SUAS_Code\experien_data\north_south2.csv';
delimiter = ',';
startRow = 2;

%% 每个文本行的格式:
%   列1: 双精度值 (%f)
%	列2: 双精度值 (%f)
%   列3: 双精度值 (%f)
%	列4: 双精度值 (%f)
%   列5: 双精度值 (%f)
%	列6: 双精度值 (%f)
%   列7: 双精度值 (%f)
%	列8: 双精度值 (%f)
%   列9: 双精度值 (%f)
%	列10: 双精度值 (%f)
%   列11: 双精度值 (%f)
%	列12: 双精度值 (%f)
%   列13: 双精度值 (%f)
%	列14: 双精度值 (%f)
%   列15: 双精度值 (%f)
%	列16: 双精度值 (%f)
%   列17: 双精度值 (%f)
%	列18: 双精度值 (%f)
%   列19: 双精度值 (%f)
%	列20: 双精度值 (%f)
% 有关详细信息，请参阅 TEXTSCAN 文档。
formatSpec = '%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%[^\n\r]';

%% 打开文本文件。
fileID = fopen(filename,'r');

%% 根据格式读取数据列。
% 该调用基于生成此代码所用的文件的结构。如果其他文件出现错误，请尝试通过导入工具重新生成代码。
dataArray = textscan(fileID, formatSpec, 'Delimiter', delimiter, 'EmptyValue' ,NaN,'HeaderLines' ,startRow-1, 'ReturnOnError', false, 'EndOfLine', '\r\n');

%% 关闭文本文件。
fclose(fileID);

%% 对无法导入的数据进行的后处理。
% 在导入过程中未应用无法导入的数据的规则，因此不包括后处理代码。要生成适用于无法导入的数据的代码，请在文件中选择无法导入的元胞，然后重新生成脚本。

%% 将导入的数组分配给列变量名称
gx_data = dataArray{:, 1};
gy_data = dataArray{:, 2};
gz_data = dataArray{:, 3};
ax_data = dataArray{:, 4};
ay_data = dataArray{:, 5};
az_data = dataArray{:, 6};
mx_data = dataArray{:, 7};
my_data = dataArray{:, 8};
mz_data = dataArray{:, 9};
px_data = dataArray{:, 10};
py_data = dataArray{:, 11};
pz_data = dataArray{:, 12};
vx_data = dataArray{:, 13};
vy_data = dataArray{:, 14};
vz_data = dataArray{:, 15};
Roll_data = dataArray{:, 16};
Pith_data = dataArray{:, 17};
Yaw_data = dataArray{:, 18};
USER_DATA1 = dataArray{:, 19};
time_DATA1 = dataArray{:, 20};


%% 清除临时变量
clearvars filename delimiter startRow formatSpec fileID dataArray ans;