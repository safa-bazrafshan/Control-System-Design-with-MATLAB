%% EP04 - PID Tuning
% Control System Design with MATLAB

clc;
clear;
close all;

%% 1. Define the Plant

s = tf('s');

G = 1/(s^2 + 2*s + 10);

disp('Plant transfer function:');
G

%% 2. Define Four Sets of PID Gains

% Case 1: Baseline controller
Kp1 = 10;
Ki1 = 5;
Kd1 = 1;

% Case 2: Increased proportional gain
Kp2 = 20;
Ki2 = 5;
Kd2 = 1;

% Case 3: Increased integral gain
Kp3 = 10;
Ki3 = 10;
Kd3 = 1;

% Case 4: Increased derivative gain
Kp4 = 10;
Ki4 = 5;
Kd4 = 3;

%% 3. Create the PID Controllers

C1 = pid(Kp1,Ki1,Kd1);
C2 = pid(Kp2,Ki2,Kd2);
C3 = pid(Kp3,Ki3,Kd3);
C4 = pid(Kp4,Ki4,Kd4);

%% 4. Create the Closed-Loop Systems

T1 = feedback(C1*G,1);
T2 = feedback(C2*G,1);
T3 = feedback(C3*G,1);
T4 = feedback(C4*G,1);

%% 5. Compare the Step Responses

t = 0:0.01:30;

figure;
step(T1,T2,T3,T4,t);
grid on;
legend('Baseline','Higher Kp','Higher Ki','Higher Kd', ...
    'Location','best');
title('Effect of PID Gain Changes on Closed-Loop Response');
xlabel('Time (s)');
ylabel('Output');

%% 6. Analyze Performance

info1 = stepinfo(T1);
info2 = stepinfo(T2);
info3 = stepinfo(T3);
info4 = stepinfo(T4);

disp('Baseline Controller Performance:');
disp(info1);

disp('Higher Kp Performance:');
disp(info2);

disp('Higher Ki Performance:');
disp(info3);

disp('Higher Kd Performance:');
disp(info4);

%% 7. Check Stability

disp('Baseline Controller Stable:');
disp(isstable(T1));

disp('Higher Kp Controller Stable:');
disp(isstable(T2));

disp('Higher Ki Controller Stable:');
disp(isstable(T3));

disp('Higher Kd Controller Stable:');
disp(isstable(T4));

%% 8. Compare DC Gains

disp('Baseline DC Gain:');
disp(dcgain(T1));

disp('Higher Kp DC Gain:');
disp(dcgain(T2));

disp('Higher Ki DC Gain:');
disp(dcgain(T3));

disp('Higher Kd DC Gain:');
disp(dcgain(T4));