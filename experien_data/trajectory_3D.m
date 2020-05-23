figure(1)
hold off;
plot(gpspx_DATA10);hold on;
plot(gpspy_DATA11);hold on;
plot(gpspz_DATA12);hold on;
figure(2)
hold off;
plot3(gpspx_DATA10/1000,gpspy_DATA11/1000,gpspz_DATA12,'b-','markersize',1.5, 'linewidth', 1.5);
figure(3)
hold off;
plot(gpspx_DATA10/1000,gpspy_DATA11/1000,'b-','markersize',1.5, 'linewidth', 1.5);