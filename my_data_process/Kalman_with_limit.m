% 压制发散的kalman

function filter = Kalman_with_limit(filter)
    %predict
    predict_x = filter.A * filter.x + filter.B * filter.u;
%     filter.P = filter.A * filter.P * filter.A' + filter.Q;
% 记录参差
   zeta=filter.z-filter.H*predict_x;
   err=zeta'*zeta ;
   limit=(filter.H * filter.P * filter.H' + filter.R);
   if(err>( 1.3*limit))%发散判据
      %     衰减记忆算法
   lamb_da=1.00;
   filter.P = filter.A * (lamb_da*filter.P) * filter.A' + filter.Q; 
   else
        filter.P = filter.A * filter.P* filter.A' + filter.Q; 
   end

    %correct
    filter.K = filter.P * filter.H' / (filter.H * filter.P * filter.H' + filter.R);
%     % 0.0592
%     0.0307
%    filter.K  
    
    filter.x = predict_x + filter.K * (filter.z - filter.H * predict_x);
    filter.P = filter.P - filter.K * filter.H * filter.P;
    
end