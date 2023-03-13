clear; close all; clc; 

Hs = 8;
T = 10;
t_end = 60;

[time, wavef] = WaveGeneratorFnc(Hs, T, t_end);

plot(time, wavef) 