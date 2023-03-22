clear; close all; clc; 

v_drum_max = 130; % rad/s

torque_drum = -2500; 

i_gb = 1: 1 : 10; 

for i = i_gb
    torque_gb(i) = torque_drum/i_gb(i);
end 

%% M3KP 280SMB 4 for ig=5
% T-equivalent circuit parameters
Rs = 0.04264; % From DC test

Z_NL = 230.9/37.47;
R_NL = 3546/(37.47^2);
X_NL = sqrt(Z_NL^2 - R_NL^2);

Z_LR = 28.87/181;
R_LR = 451.8/(181^2);
Rr_prime = R_LR - Rs; % reflected stator resistance
X_LR = sqrt(Z_LR^2 - R_LR^2);
X_LR_50Hz = 50/12.5 * X_LR;

% Using Design Class B Motor
X1 = 0.4 * X_LR_50Hz
X2 = 0.6 * X_LR_50Hz

XM = X_NL - X1;

w1 = 2 * 1500; % Polepairs x syncspeed
wr = 2 * 1483; % polepairs x mechanical speed

slip = (w1 - wr)/w1;





