clear; close all; clc; 

v_drum_max = 144; % rad/s

torque_drum = 2000; 

i_gb = 1: 1 : 10; 

for i = i_gb
    torque_gb(i) = torque_drum/i_gb(i);
end 

%% M3KP 280SMB 4 for ig=5
T_N = 579 % Nominal torque [Nm]
PF_N = 0.85; % Nominal power factor
f=50;
n_N = 1483; % mechanical speed [rpm]
P_N = 90000 % Nominal mechanical power [W]
U = 400; % line-to-line rms stator voltage [V]
eta_N = 0.947; % efficiency
n_p = 2; % pole pairs
I_N=160;

% T-equivalent circuit parameters
Rs = 0.04264; % From DC test

Z_NL = 230.9/37.47;
R_NL = 3546/(37.47^2);
X_NL = sqrt(Z_NL^2 - R_NL^2);

Z_LR = 64.87/375.6;
R_LR = 2960/(375.6^2);
Rr_prime = abs(R_LR - Rs); % reflected stator resistance 
X_LR = sqrt(Z_LR^2 - R_LR^2);
X_LR_50Hz = 50/12.5 * X_LR;

% Using Design Class A Motor
X1 = 0.5 * X_LR_50Hz; % Xs
X2 = 0.5 * X_LR_50Hz; % Xr

XM = X_NL - X1; % Lm

w1 = 2 * 1500; % Polepairs x syncspeed
wr = 2 * 1483; % polepairs x mechanical speed

slip = (w1 - wr)/w1;
psi_R = 20*P_N/(sqrt(2)*pi*n_p*I_N*n_N);

Lr = XM + X2;
L_M = XM^2/Lr;

PSI_R = XM/Lr * psi_R;
L_sigma =abs((XM+X1) - Lr);
RR = (XM/Lr)^2 * Rr_prime; 



