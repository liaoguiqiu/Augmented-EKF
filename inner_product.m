 
lentha=length(my_est_save.kalman_high_acc_est);
for ii=1:100
    AA=0;
    BB=0;
    CC=0;
    for kk=101:(lentha-101)
       AA=AA+ my_est_save.kalman_high_acc_est(kk+ii)*my_est_save.Acc(kk,3);
       BB=BB+ my_est_save.kalman_high_acc_est(kk+ii)*my_est_save.kalman_high_acc_est(kk+ii);
       CC=CC+ my_est_save.Acc(kk,3)*my_est_save.Acc(kk,3); 
    end
    similarity= AA/(BB*CC)^0.5;
    correlation_off_acc(ii)= similarity;
end
figure(8)
hold off;
plot(correlation_off_acc);hold on;grid on;

