function [filterf,filter1,filter2,filter3]  = Kalman_fuse_3sensors (filterf,filter1,filter2,filter3)
 %For GFA Filter 1; gama=no. of local sensors
%  传感器数量
 m=3; % no. of local sensors
	gama1=3; gama1i=1/gama1;   
% For GFA filter 2
	gama2=3; gama2i=1/gama2;
    gama3=3; gama3i=1/gama3;
    
%predict
    filterf.x = filterf.A * filterf.x + filterf.B * filterf.u;
    filterf.P = filterf.A * filterf.P * filterf.A' + filterf.Q;
   % Reset the local filters
    filter1.x  =  filterf.x ;
    filter2.x  =  filterf.x ;
    filter3.x  =  filterf.x ;
    filter1.P  =  filterf.P ;
    filter2.P  =  filterf.P ;
    filter3.P  =  filterf.P ;
    % SENSOR 1   
% measurement update for local gain/estimation  
	filter1.K=gama1i*filterf.P*filter1.H'*inv(filter1.H*filterf.P*filter1.H'+gama1i*filter1.R);
% Filtered local estimate 
	filter1.x = filterf.x + filter1.ok* filter1.K * (filter1.z - filterf.H *filterf.x);
        % SENSOR 2   
% measurement update  
	filter2.K=gama2i*filterf.P*filter2.H'*inv(filter2.H*filterf.P*filter2.H'+gama2i*filter2.R);
%  local estimate 
	filter2.x = filterf.x + filter2.ok* filter2.K * (filter2.z - filterf.H *filterf.x);
         % SENSOR 3  
% measurement update  
	filter3.K=gama2i*filterf.P*filter3.H'*inv(filter3.H*filterf.P*filter3.H'+gama3i*filter3.R);
%  local estimate 
	filter3.x = filterf.x + filter3.ok* filter3.K * (filter3.z - filterf.H *filterf.x);
  
    % GLOBAL FUSION    
% State/Covariance  
	 filterf.x = filter1.x + filter2.x + filter3.x -(m-1)* filterf.x ;
     IKH=eye(length(filterf.x))-filter1.K*filter1.H-filter2.K*filter2.H-filter3.K*filter3.H;
     filterf.P=IKH*filterf.P*IKH'+filter1.K*filter1.R*filter1.K'+filter2.K*filter2.R*filter2.K'+filter3.K*filter3.R*filter3.K';
    
     
end