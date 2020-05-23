% 读取数据
clc
clear all
close all
% data= csvread('baro_gps2.csv',10,0);
 
data= csvread('rollpitchyaw.csv',10,0);

gx=data(:,1);
gy=data(:,2);
gz = data(:,3);
ax=data(:,4);
ay=data(:,5);
az = data(:,6);
mx =  data(:,7);
my =  data(:,8);
mz =  data(:,9);
roll =  data(:,10);
pith =  data(:,11);
yaw =  data(:,12);
 

gx=gx';
gy=gy';
gz = gz';
ax=ax';
ay=ay';
az = az';
mx = mx';
my = my';
mz =  mz';
roll = roll';
pith = pith';
yaw =yaw';
 
 


% 读取数据
 
% z = [a; b];
z = [gx ;gy ;gz ;ax ;ay ;az  ;mx  ;my ;mz  ;roll  ;pith  ;yaw ];
my_sensor_data=z;
save('my_sensor_data.mat','my_sensor_data');
figure(1)
plot(z(1,:) )
figure(2)
plot(z(2,:) )
figure(3)
plot(z(3,:) )
figure(4)
plot(z(4,:) )
figure(5)
plot(z(5,:) )
figure(6)
plot(z(6,:) )
figure(7)
plot(z(7,:) )
figure(8)
plot(z(8,:) )
figure(9)
plot(z(9,:) )
figure(10)
plot(z(10,:) )
figure(11)
plot(z(11,:) )
figure(12)
plot(z(12,:) )