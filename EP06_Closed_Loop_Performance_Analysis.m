
%% EP06 - Closed-Loop Performance Analysis
% Control System Design with MATLAB

clc;
clear;
close all;

%% 1. Define the Plant

s = tf('s');

G = 1/(s^2 + 2*s + 10);

disp('Plant transfer function:');
G

%% 2. Tune the PID Controller

C_PID = pidtune(G,'PID');

disp('Tuned PID Controller:');
C_PID

%% 3. Create the Closed-Loop System

T = feedback(C_PID*G,1);

disp('Closed-loop transfer function:');
T

%% 4. Plot the Closed-Loop Step Response

figure;
step(T);
grid on;
title('Closed-Loop Step Response');
xlabel('Time (s)');
ylabel('Output');

%% 5. Calculate Performance Metrics

info = stepinfo(T);

disp('Closed-loop performance metrics:');
disp(info);

%% 6. Extract Key Performance Values

rise_time = info.RiseTime;
settling_time = info.SettlingTime;
overshoot = info.Overshoot;
peak_value = info.Peak;
peak_time = info.PeakTime;

disp('Rise Time (s):');
disp(rise_time);

disp('Settling Time (s):');
disp(settling_time);

disp('Overshoot (%):');
disp(overshoot);

disp('Peak Value:');
disp(peak_value);

disp('Peak Time (s):');
disp(peak_time);

%% 7. Check Closed-Loop Stability

poles_T = pole(T);
stable_T = isstable(T);

disp('Closed-loop poles:');
disp(poles_T);

disp('Is the closed-loop system stable?');
disp(stable_T);

%% 8. Analyze Steady-State Performance

dc_gain = dcgain(T);

reference_value = 1;
steady_state_output = dc_gain * reference_value;
steady_state_error = reference_value - steady_state_output;

disp('Closed-loop DC gain:');
disp(dc_gain);

disp('Steady-state output for a unit-step reference:');
disp(steady_state_output);

disp('Steady-state error:');
disp(steady_state_error);

%% 9. Display a Summary

fprintf('\n--- Closed-Loop Performance Summary ---\n');
fprintf('Rise Time: %.4f seconds\n', rise_time);
fprintf('Settling Time: %.4f seconds\n', settling_time);
fprintf('Overshoot: %.4f percent\n', overshoot);
fprintf('Peak Value: %.4f\n', peak_value);
fprintf('Peak Time: %.4f seconds\n', peak_time);
fprintf('DC Gain: %.4f\n', dc_gain);
fprintf('Steady-State Error: %.4f\n', steady_state_error);
fprintf('Stable: %d\n', stable_T);
