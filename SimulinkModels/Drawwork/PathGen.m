clear; close all; clc; 

start_height = 75.0; 
end_height = 15.0; 
down_velocity = 1.0; 
hold_time = 10.0; 
t = 0.0; 
h = start_height; 
t_step = 0.005;
counter = 1;

while t < (hold_time * 2 + (start_height - end_height) / down_velocity)
    %Hold period
    if t < hold_time
        h = start_height;
    %Ramp period
    elseif t < (hold_time + (start_height - end_height) / down_velocity)
        h = start_height - down_velocity * (t - hold_time);
    %End period
    else
        h = end_height;
    end

    xPlot(counter) = h;
    tPlot(counter) = t;
    
    t = t + t_step;
    counter = counter + 1; 
end

plot(tPlot, xPlot); 