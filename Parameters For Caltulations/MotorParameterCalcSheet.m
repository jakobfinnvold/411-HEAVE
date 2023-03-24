clear; close all; clc; 
% Data from datasheet
T_N = 579; % Nominal torque [Nm]
PF_N = 0.85; % Nominal power factor
f=50; % Frequency
n_N = 1483; % mechanical speed [rpm]
P_N = 90000; % Nominal mechanical power [W]
U = 400; % line-to-line rms stator voltage [V]
eta_N = 0.947; % efficiency at full load
n_p = 2; % pole pairs (4-pole motor)
I_N=160; % Nominal current
J_motor = 1.5; % Motor inertia kgm^2

% Preliminary calculations
omega_N = 2*pi*f; % angular stator frequency [rad/s]
omega_mN = 2*pi*n_N/60; % mechanical rotor speed in [rad/s]
omega_rN = n_p*omega_mN; % electrical rotor speed in [rad/s]
s_N = (omega_N-omega_rN)/omega_N; % Nominal slip
V_s = U/sqrt(3); % Phase voltage [V,rms]
Q_N = sqrt(3)*U*I_N*sin(acos(PF_N)); % Reactive power [VAR]

R_R_gamma = 0.0193;
X_M_gamma = 2.81;
X_sigma_gamma = 0.0445;
R_S_gamma = 0.5 * R_R_gamma;

%Voltages and currents
%i_R_vec = -15.6767 + 1i*0.3266;
%i_s_vec = 65.32 - 130.64*1i;
Q_N = 5.8395e4; % Reactive power

Z =0.1980 + 2.0802*1i; % X-sig, X_m, RR + slip, Impedance from stator
i_s_vec = sqrt(2)*U/sqrt(3)/Z;
i_R_vec = -(sqrt(2)*U/sqrt(3) - 1i*X_sig*i_s_vec)/(R_R/s);

T = 3/2*n_p*R_R*abs(i_R_vec)^2/(s*omega_1); % induced torque
v_s = U/sqrt(3)*sqrt(2);
Q = 3/2*imag(v_s*conj(i_s_vec)); % Reactive power line to neutral
P = T*omega_1/n_p*(1-s); % mechanical power

















% Functions
function Z = f1(R_R, X_M, X_sig, s)
Z = 1i*X_sig + 1/( 1/(1i*X_M) + 1/(R_R/s) );
end