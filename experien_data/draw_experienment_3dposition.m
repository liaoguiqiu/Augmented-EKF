if ~exist('flight1')
  read_flight1;

end
if ~exist('flight2')
  read_flight2;
end
 start = 1;
 last = 1500 ;
 data_buff =zeros(1,9);
      dt_s = 0.04;
  Len1 = length(     flight2.USER_DATA11)
  pgpsx= flight2.USER_DATA1;
  pgpsy= flight2.USER_DATA2;
  pgpsz= flight2.USER_DATA3;
  
  
  fusex = flight2.USER_DATA10(1:100:Len1);
  fusey = flight2.USER_DATA11(1:100:Len1);
  fusez =  flight2.USER_DATA3(1:100:Len1);
%   n=5; % n为模板长度，值可以改变
% mean = ones(1,n)./n;  %mean为1×n的模板，各数组元素的值均为1/n
% fusez = conv(fusez,mean);
  Len2  = length (fusez)
  time2 = 1:0.005 :Len2 ;
  fusez2 = interp1(1:1:Len2,fusez ,time2 , 'cubic');
  
  Len2  = length (fusex)
  time2 = 1:0.005 :Len2 ;
  fusex2 = interp1(1:1:Len2,fusex ,time2 , 'cubic');
   time2 = 1:0.005 :Len2 ;
  fusey2 = interp1(1:1:Len2,fusey ,time2 , 'cubic');
  
  
  point1 =1 ;
  point2 = 14000;
  sample = 10;
  point3 =1 ;
  point4 = 28000;
    sample2 = 10;
  figure(1)
  plot3( pgpsx(point1:sample:point2),pgpsy(point1:sample:point2) , pgpsz(point1:sample:point2),'r') ;hold on
    plot3( fusex2(point3:sample2:point4),fusey2(point3:sample2:point4) ,fusez2(point3:sample2:point4),'b') ; 
    grid on
 



