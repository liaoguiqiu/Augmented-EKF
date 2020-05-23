clear all;
                          % Draw An Arc Of Blue Stars


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


% assidn the trajectory value 

my_pos = my_est_save_paper_method.ad_pos ;
truex = uavTruth_paper_method.east_m;
truey = uavTruth_paper_method.north_m;
truez = uavTruth_paper_method.h_msl_m;
worsez  = uavestargumentKF.h_msl_m;

LENG = length(my_pos(:,1));


% circular test
circr = @(radius,rad_ang)  [radius*cos(rad_ang);  radius*sin(rad_ang)];         % Circle Function For Angles In Radians
circd = @(radius,deg_ang)  [radius*cosd(deg_ang);  radius*sind(deg_ang)];       % Circle Function For Angles In Degrees
N = 25;                                                         % Number Of Points In Complete Circle
r_angl = linspace(0, 5*pi, LENG);                             % Angle Defining Arc Segment (radians)
radius = 5.5;                                                   % Arc Radius
xy_r = circr(radius,r_angl);                                    % Matrix (2xN) Of (x,y) Coordinates
figure(2)
plot(xy_r(1,:), xy_r(2,:), 'r.')      
Circle_x = xy_r(1,:)
Circle_y = xy_r(2,:)
Circle_x   =  Circle_x'
Circle_y  = Circle_y'
% combine to create a curve

my_x = my_pos(:,1);
my_y = my_pos(:,2);
my_z = my_pos(:,3);
endpoint = LENG;

H = 1:1:LENG;
H = H/4000;
H = H';
my_x = my_z +Circle_x;
my_y = my_z +Circle_y;
my_z = 0.7*my_z +H;
 
truex = truez +Circle_x;
truey = truez +Circle_y;
truez = 0.7*truez +H;
 

worsex  =  worsez + Circle_x;
worsey  =  worsez + Circle_y;
worsez  =  0.7*worsez + H;


figure(1)
hold off;
% figure for the angle compare
  point1 =10000 ;
  point2 = LENG;
   
    sample2 = 10;
  figure(1)
  plot3( my_x(point1:sample2:point2), my_y(point1:sample2:point2) , my_z(point1:sample2:point2) ,'b.') ;hold on
  plot3( truex(point1:sample2:point2),truey(point1:sample2:point2) ,truez(point1:sample2:point2),'r.') ; 
  plot3( worsex(point1:sample2:point2),worsey(point1:sample2:point2) ,worsez(point1:sample2:point2),'g.') ; 
  
  grid on





