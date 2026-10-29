
%% EP05 - PID Tuning in MATLAB
% Control System Design with MATLAB

clc;
clear;
close all;

%% 1. Define the Plant

s = tf('s');

G = 1/(s^2 + 2*s + 10);

disp('Plant transfer function:');
G

%% 2. Tune a PID Controller Automatically

C_PID = pidtune(G,'PID');

disp('Automatically Tuned PID Controller:');
C_PID

%% 3. Create the Closed-Loop System

T_PID = feedback(C_PID*G,1);

disp('Closed-loop transfer function:');
T_PID

%% 4. Plot the Closed-Loop Step Response

figure;
step(T_PID);
grid on;
title('Automatically Tuned PID Controller');
xlabel('Time (s)');
ylabel('Output');

%% 5. Analyze Closed-Loop Performance

info_PID = stepinfo(T_PID);

disp('Closed-loop performance:');
disp(info_PID);

%% 6. Check Stability

stable_PID = isstable(T_PID);

disp('Is the closed-loop system stable?');
disp(stable_PID);

%% 7. Calculate DC Gain

dc_PID = dcgain(T_PID);

disp('Closed-loop DC gain:');
disp(dc_PID);

%% 8. Compare Plant and Closed-Loop Responses

figure;
step(G,T_PID);
grid on;
legend('Open-Loop Plant','Closed-Loop with Tuned PID', ...
    'Location','best');
title('Plant Response vs. Tuned PID Response');
xlabel('Time (s)');
ylabel('Output');
