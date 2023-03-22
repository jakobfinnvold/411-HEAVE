clear; close all; clc; 

v_drum_max = 130; % rad/s

torque_drum = -2500; 

i_gb = 1: 1 : 10; 

for i = i_gb
    torque_gb(i) = torque_drum/i_gb(i);
end 




