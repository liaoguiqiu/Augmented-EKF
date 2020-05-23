clear all
interval = pi/18;
t = 1:interval:100*pi;
len = size(t, 2);
loss1= t./t;
loss2=loss1;
% 传感器失效
loss1 = [loss1(1:1000)  loss1(1001:1200)*0  loss1(1201:len)  ];
loss2 = [loss2(1:600)  loss2(601:800)*0  loss2(801:len)  ];
% a = t .* sin(t/10) +  300 * (rand(1,len)-0.5);
% b = t .* sin(t/10) +  100 * (rand(1,len)-0.5);
a =t ./t*100 +  300 * (rand(1,len)-0.5);
b = t./t *100 +  100 * (rand(1,len)-0.5);
c = t./t *100 +  500 * (rand(1,len)-0.5);
% 传感器失效
a = loss1.* a;
b=  loss2.* b;
 
z = [a; b;c;loss1;loss2];
figure(1);
hold off;
save('z.mat','z');
plot(z(2,:),'-');
hold on;
plot(z(1,:),'-');
hold on;
plot(z(3,:),'-');
figure(2)
plot(a1)