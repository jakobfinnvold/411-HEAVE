clear; close all; clc; 

%% Mechanical Parameters
d_Drum = 23.23e-2; % Meter
Drum_Friction = 0.001; % Ns/m
Drum_Inertia = 1.0; %kgm^2

n_sh = 5;

%% Load Case 1
Hs = 2.2; % m
T_w = 8.0; % s
m_payload = 8000; % kg
h_payload_0 = 75; % m
h_payload_final = h_payload_0; % m
h_seabed = 350; % m

%% Load Case 2
Hs = 2.2; % m
T_w = 8.0; % s
m_payload = 8000; % kg
h_payload_0 = 75; % m
h_payload_final = 15; % m
h_seabed = 350; % m

%% Load Case 3
Hs = 2.2; % m
T_w = 8.0; % s
m_payload = 8000; % kg
h_payload_0 =15; % m
h_payload_final = 0; % m
h_seabed = 350; % m

%% Sensors
% Noise simulation
sigma_w = 0.5; %m/s^2 (Standard deviation of noise)
beta = 10000; % Positive constant [-]

%% Payload parameters
% mass already defined (8000kg)
Volume_pl = 2; %m^3
Area_pl = 1.5; %m^2
C_D = 1.8; %[-] Drag coefficient

syms rho vel
F_drag = 0.5 * rho * vel^2 * C_D * Area_pl; % Density of sea water(surface) approx 1.025 kg/m^3, velocity comes from the simulation. 

%% Seabed
k_spring = 1.8e6; %N/m
b_damper = 6.5e5; %Ns/m
syms delta_x
if delta_x < 0
    F_sb = 0;
else
    F_sb = k_spring*delta_x + b_damper*vel*sqrt(delta_x); 
end 

%% Bouyant force
% The force pushing upwards when something floats down in water. Dependend
% on the fluid density, volume of the object falling and gravity
g = 9.81; 
F_boy = rho * Volume_pl * g;

%% Electrical motor + Frequency converter
% Insert selected motor and converter w/parameters here. 
% Select these from MotorData.pdf and DriveData.pdf
% First task should be to find a suitable motor...

% Then, simulate the system using said choices. Implement field-oriented
% control. This is only for electrical part. Should be switched out when
% using speedgoat and PLC. (PLC should do the motion control). 
