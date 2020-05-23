if ~exist('skate')
  read_skate;

end
 
 
  Len1 = length(     skate.USER_DATA11)
    Ax= skate.Angle_PIT;
    Ay= skate.Angle_ROL;
    Az= skate.Angle_YAW;
    Aix =  skate .MAG_X /100.0 ;
   Aiy =  skate .MAG_Y /100.0 ;
   Aiz =  skate .MAG_Z /100.0 ;
  point1 =1 ;
  point2 = 14000;
  sample = 10;
  point3 =1 ;
  point4 = 28000;
    sample2 = 10;
  figure(1)
  subplot(3,1,1)
  hold off;
  plot(Ax) ;hold on;
  plot(Aix) ;
  subplot(3,1,2)
  hold off;
  plot(Ay) ;hold on;
  plot(Aiy) ;
   subplot(3,1,3)
  hold off;
  plot(Az) ;hold on;
  plot(Aiz) ;
  
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  figure(2)
   subplot(2,1,1)
  hold off;
  mean1= Ax(2900:3066);
  mvalu1 = sum(mean1)/length(mean1);
  mean2= Aix(2900:3066);
  mvalu2 = sum(mean2)/length(mean2);
  er1   = Ax - mvalu1;
  er2   = Aix - mvalu2;
    er3  = 0.2*er1  + 0.2*er2 ; 

    
    er1 = 0.5 *er1;
    
   er1 = er1(end:-1:1);
   er2 = er2(end:-1:1);
   er3 = er3(end:-1:1);
        er1=er1(200:700);
       er2=er2(200:700)
       er3=er3(200:700)
  plot(er1 ) ;hold on;
    plot(er2 ) ;hold on;
    plot(er3 ) ;hold on;
   grid on
     subplot(2,1,2)
  hold off;
  mean1= Ay(1:380);
  mvalu1 = sum(mean1)/length(mean1);
  mean2= Aiy(1:380);
  mvalu2 = sum(mean2)/length(mean2);
  er1  = Ay - mvalu1;
  er2  = Aiy - mvalu2;
  er3 = 0.2*er1  + 0.2*er2 ; 
     er1=er1(260:760);
       er2=er2(260:760)
       er3=er3(260:760)
       er1 = 0.5* er1;
  plot(er1) ;hold on;
    plot(er2) ;hold on;
    plot(er3) ;hold on;
  grid on
  