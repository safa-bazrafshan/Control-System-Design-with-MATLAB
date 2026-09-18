
%% EP01 - Introduction to Control System Design
% Control System Design with MATLAB

clc;
clear;
close all;

%% 1. Define the Plant

s = tf('s');

G = 10/(s^2 + 2*s + 10);

disp('Plant transfer function:');
G

%% 2. Open-Loop Step Response

figure;
step(G);
grid on;
title('Open-Loop Step Response');
xlabel('Time (s)');
ylabel('Output');

%% 3. Create the Unity-Feedback Closed-Loop System

T = feedback(G,1);

disp('Closed-loop transfer function:');
T

%% 4. Closed-Loop Step Response

figure;
step(T);
grid on;
title('Closed-Loop Step Response');
xlabel('Time (s)');
ylabel('Output');

%% 5. Compare Open-Loop and Closed-Loop Responses

figure;
step(G,T);
grid on;
legend('Open-Loop','Closed-Loop');
title('Open-Loop vs. Closed-Loop Response');
xlabel('Time (s)');
ylabel('Output');

%% 6. Analyze Closed-Loop Performance

info = stepinfo(T);

disp('Closed-loop performance:');
disp(info);

%% 7. Check Stability

stable = isstable(T);

disp('Is the closed-loop system stable?');
disp(stable);

