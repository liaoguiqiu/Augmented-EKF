clear
% close all
clc

dim_observe = 1;      %观测值维数
n = 1;  %状态维数，观测状态每个维度都有1个速度，故需乘2
% filter.A = eye(n);%[1,0,1,0;0,1,0,1;0,0,1,0;0,0,0,1]; 
% filter.A =  [1,1;0,1]; 
filterf.A =  1; 
filterf.B = 0;
filterf.u = 0;
filterf.P = eye(n);
filterf.K = zeros(n);
% filterf.H = eye(n);%[1,0,0,0;0,1,0,0];
% filterf.H =  [1,0;1,0];
filterf.H = 1;
cQ = 5e-3;
cR = 300;
filterf.Q = eye(n) * cQ;    %这里简单设置Q和R对角线元素都相等，设为不等亦可
filterf.R = eye(dim_observe) * cR;
% filterf.R = [500*cR  0;0     cR    ]
filterf.x = zeros(n,1); %初始状态x0
filterf.ok = 1; %初始状态x0

filter1.A =  1; 
filter1.B = 0;
filter1.u = 0;
filter1.P = eye(n);
filter1.K = zeros(n);
% filter1.H = eye(n);%[1,0,0,0;0,1,0,0];
% filter1.H =  [1,0;1,0];
filter1.H = 1;
cQ = 5e-4;
cR = 300;
filter1.Q = eye(n) * cQ;    %这里简单设置Q和R对角线元素都相等，设为不等亦可
filter1.R = eye(dim_observe) * cR;
% filter1.R = [500*cR  0;0     cR    ]
filter1.x = zeros(n,1); %初始状态x0
filter1.ok = 1; %初始状态x0


filter2.A =  1; 
filter2.B = 0;
filter2.u = 0;
filter2.P = eye(n);
filter2.K = zeros(n);
% filter2.H = eye(n);%[1,0,0,0;0,1,0,0];
% filter2.H =  [1,0;1,0];
filter2.H = 1;
cQ = 5e-3;
cR = 100;
filter2.Q = eye(n) * cQ;    %这里简单设置Q和R对角线元素都相等，设为不等亦可
filter2.R = eye(dim_observe) * cR;
% filter2.R = [500*cR  0;0     cR    ]
filter2.x = zeros(n,1); %初始状态x0
filter2.ok = 1; %初始状态x0

filter3.A =  1; 
filter3.B = 0;
filter3.u = 0;
filter3.P = eye(n);
filter3.K = zeros(n);
% filter3.H = eye(n);%[1,0,0,0;0,1,0,0];
% filter3.H =  [1,0;1,0];
filter3.H = 1;
cQ = 5e-2;
cR = 500;
filter3.Q = eye(n) * cQ;    %这里简单设置Q和R对角线元素都相等，设为不等亦可
filter3.R = eye(dim_observe) * cR;
% filter3.R = [500*cR  0;0     cR    ]
filter3.x = zeros(n,1); %初始状态x0
filter3.ok = 1; %初始状态x0

load('z.mat');

t = 1;
out = [];
for i=1:size(z,2)
    new_data=z(:,i);
    filter1.z=new_data(1);
    filter2.z=new_data(2);
    filter3.z=new_data(3);
    filter1.ok=new_data(4);
    filter2.ok=new_data(5);
    filter3.ok = 1; %初始状态x0
%     filter.z = z(:,i);
%     filter = Kalman(filter);
   [filterf,filter1,filter2,filter3] =  Kalman_fuse_3sensors (filterf,filter1,filter2,filter3);
    save.iniz1(i)=filter1.z;
     save.iniz2(i)=filter2.z;
     save.iniz3(i)=filter3.z;
      save.x(i)=filterf.x;
%     pause(.5)
end

figure(1),
hold off;
plot( save.iniz1,  'r-');hold on    
plot( save.iniz2,  'b-');hold on 
plot( save.iniz3,  'y-');hold on 
plot( save.x,  'g-');    hold on
