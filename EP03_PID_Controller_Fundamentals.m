%% EP03 - PID Controller Fundamentals
% Control System Design with MATLAB

clc;
clear;
close all;

%% 1. Define the Plant

s = tf('s');

G = 1/(s^2 + 2*s + 10);

disp('Plant transfer function:');
G

%% 2. Define PID Gains

Kp = 10;
Ki = 5;
Kd = 1;

%% 3. Create the P, PI, PD, and PID Controllers

C_P = pid(Kp,0,0);
C_PI = pid(Kp,Ki,0);
C_PD = pid(Kp,0,Kd);
C_PID = pid(Kp,Ki,Kd);

disp('P Controller:');
C_P

disp('PI Controller:');
C_PI

disp('PD Controller:');
C_PD

disp('PID Controller:');
C_PID

%% 4. Create the Closed-Loop Systems

T_P = feedback(C_P*G,1);
T_PI = feedback(C_PI*G,1);
T_PD = feedback(C_PD*G,1);
T_PID = feedback(C_PID*G,1);

%% 5. Compare the Closed-Loop Step Responses

t = 0:0.01:30;

figure;
step(T_P,T_PI,T_PD,T_PID,t);
grid on;
legend('P','PI','PD','PID');
title('Comparison of P, PI, PD, and PID Controllers');
xlabel('Time (s)');
ylabel('Output');

%% 6. Analyze System Performance

info_P = stepinfo(T_P);
info_PI = stepinfo(T_PI);
info_PD = stepinfo(T_PD);
info_PID = stepinfo(T_PID);

disp('P Controller Performance:');
disp(info_P);

disp('PI Controller Performance:');
disp(info_PI);

disp('PD Controller Performance:');
disp(info_PD);

disp('PID Controller Performance:');
disp(info_PID);

%% 7. Check Stability

disp('P Controller Stable:');
disp(isstable(T_P));

disp('PI Controller Stable:');
disp(isstable(T_PI));

disp('PD Controller Stable:');
disp(isstable(T_PD));

disp('PID Controller Stable:');
disp(isstable(T_PID));

%% 8. Compare DC Gains

dc_P = dcgain(T_P);
dc_PI = dcgain(T_PI);
dc_PD = dcgain(T_PD);
dc_PID = dcgain(T_PID);

disp('DC Gain - P:');
disp(dc_P);

disp('DC Gain - PI:');
disp(dc_PI);

disp('DC Gain - PD:');
disp(dc_PD);

disp('DC Gain - PID:');
disp(dc_PID);