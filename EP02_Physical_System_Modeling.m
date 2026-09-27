%% EP02 - Physical System Modeling in MATLAB
% Control System Design with MATLAB

clc;
clear;
close all;

%% 1. Define the Physical System

% Mass-Spring-Damper System
m = 1;      % Mass (kg)
b = 2;      % Damping coefficient (N.s/m)
k = 10;     % Spring constant (N/m)

%% 2. Derive the Transfer Function

% Equation of motion:
% m*x'' + b*x' + k*x = F

s = tf('s');

G = 1/(m*s^2 + b*s + k);

disp('Transfer function of the mass-spring-damper system:');
G

%% 3. Display System Poles

p = pole(G);

disp('System poles:');
disp(p);

%% 4. Open-Loop Step Response

figure;
step(G);
grid on;
title('Step Response of the Mass-Spring-Damper System');
xlabel('Time (s)');
ylabel('Position (m)');

%% 5. System Performance

info = stepinfo(G);

disp('System performance:');
disp(info);

%% 6. Check Stability

stable = isstable(G);

disp('Is the system stable?');
disp(stable);

%% 7. DC Gain

dc_gain = dcgain(G);

disp('DC gain of the system:');
disp(dc_gain);