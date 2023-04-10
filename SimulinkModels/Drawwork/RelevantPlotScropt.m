
tiledlayout(2,1)
nexttile
plot(out.torque_case2)
title('Torque Measurement, Case 3')
grid on
nexttile
plot(out.pos_errpr)
title('Position Error, Case 3')
ylabel('m')
grid on
%%
num = 1;
den = [0.00014164788373287055 (2*pi*50*0.00014164788373287055 + 0.061939999999999995)];
gs = tf(num, den)
