function [out, energy]=correlation_of_two_singnal(x,y)
 
 
lentha=length(x);
% %求均值
%  aver=0;
% for kk=1:lentha 
%       aver=aver+ x(kk);
% end
% aver = aver / lentha;
% %求均值结束
% %平移
% x = x - aver;
% y = y - aver;
%求能量
BB=0;
   for kk=101:(lentha-101)
      
       BB=BB+ x(kk )*x(kk );
    
   end
BB=BB / lentha;
% if(BB<0.1)
% energy=BB;
% out = zeros(1,101); 
% return
% end

for ii=-50:50
    AA=0;
%     BB=0;
%     CC=0;
    for kk=101:(lentha-101)
       AA=AA+ x(kk+ii)*y(kk);
%       BB=BB+ x(kk+ii)*x(kk+ii);
%        CC=CC+ y(kk)*y(kk); 
    end
    similarity= AA ;%/(BB*CC)^0.5;
    correlation_off_acc(ii+51)= similarity;
end
energy=BB;
out = correlation_off_acc;

end