clear; close all; clc; 
% Current selection: M3JP 315SMC 4
% Motor
omega_m = 1.5;
PM_max = 200e3;
poleselect = [2; 4; 6; 8]; % Number of poles
n_p = poleselect(2,1);
PM = 160e3;
CM = omega_m * (1 + (PM/PM_max) + abs(n_p - 4)/4); 
CM_max = omega_m * (1 + (PM_max/PM_max) + abs(8 - 4)/4); 


% Drive
omega_c = 2.5; % [-]
Pc_max = 200e3; % Watt
P_c = 100e3; 
C_c = omega_c*(1+P_c/Pc_max); 
C_c_max = omega_c*(1+Pc_max/Pc_max); 

% GB
W_GB = 2;
i_gb = 6; 

C_GB = W_GB*(1 + i_gb/10); 
C_GB_max = W_GB*(1 + 10/10); 

% Sum
C_total = C_GB + C_c + CM; 

C_Max = C_GB_max + C_c_max + CM_max;  

