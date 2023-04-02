
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
