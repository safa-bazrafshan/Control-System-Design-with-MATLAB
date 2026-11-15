
%% EP07 - Root Locus for Controller Design
% Control System Design with MATLAB

clc;
clear;
close all;

%% 1. Define the Plant

s = tf('s');

G = 1/(s^2 + 2*s + 10);

disp('Plant transfer function:');
G

%% 2. Plot the Root Locus

figure;
rlocus(G);
grid on;
title('Root Locus of the Plant');

%% 3. Calculate Open-Loop Poles and Zeros

open_loop_poles = pole(G);
open_loop_zeros = zero(G);

disp('Open-Loop Poles:');
disp(open_loop_poles);

disp('Open-Loop Zeros:');
disp(open_loop_zeros);

%% 4. Select a Gain Using Root Locus

K = 20;

C = K;

disp('Selected Controller Gain:');
disp(K);

%% 5. Create the Closed-Loop System

T = feedback(C*G,1);

disp('Closed-Loop Transfer Function:');
T

%% 6. Calculate Closed-Loop Poles

closed_loop_poles = pole(T);

disp('Closed-Loop Poles:');
disp(closed_loop_poles);

%% 7. Check Closed-Loop Stability

stable = isstable(T);

disp('Is the Closed-Loop System Stable?');
disp(stable);

%% 8. Plot the Closed-Loop Step Response

figure;
step(T);
grid on;
title('Closed-Loop Step Response with Selected Gain');
xlabel('Time (s)');
ylabel('Output');

%% 9. Analyze Closed-Loop Performance

info = stepinfo(T);

disp('Closed-Loop Performance:');
disp(info);

%% 10. Display DC Gain

dc_gain = dcgain(T);

disp('Closed-Loop DC Gain:');
disp(dc_gain);
