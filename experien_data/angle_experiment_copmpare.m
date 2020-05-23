%% 导入文本文件中的数据。
% 用于从以下文本文件导入数据的脚本:
%
%    G:\kalman_study\suas_code_v1\SUAS_Code\experien_data\姿态对比.csv
%
% 要将代码扩展到其他选定数据或其他文本文件，请生成函数来代替脚本。

% 由 MATLAB 自动生成于 2017/06/09 15:10:37

%% 初始化变量。
filename = 'G:\kalman_study\suas_code_v1\SUAS_Code\experien_data\姿态对比.csv';
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
% 有关详细信息，请参阅 TEXTSCAN 文档。
formatSpec = '%f%f%f%f%f%f%f%f%f%f%f%f%[^\n\r]';

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
ACC_X = dataArray{:, 1};
ACC_Y = dataArray{:, 2};
ACC_Z = dataArray{:, 3};
GYR_X = dataArray{:, 4};
GYR_Y = dataArray{:, 5};
yaw_mag = dataArray{:, 6}/100;
roll_dcm = dataArray{:, 7}/100;
pit_dcm = dataArray{:, 8}/100;
yaw_dcm = dataArray{:, 9}/100;
Angle_ROL = dataArray{:, 10};
Angle_PIT = dataArray{:, 11};
Angle_YAW = dataArray{:, 12};


%% 清除临时变量
clearvars filename delimiter startRow formatSpec fileID dataArray ans;