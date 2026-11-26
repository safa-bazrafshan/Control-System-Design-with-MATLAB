
%% EP08 - Bode Plot for Controller Design
% Control System Design with MATLAB

clc;
clear;
close all;

%% 1. Define the Plant

s = tf('s');

G = 1/(s^2 + 2*s + 10);

disp('Plant transfer function:');
G

%% 2. Define a Proportional Controller

K = 20;

C = K;

disp('Proportional Controller Gain:');
disp(K);

%% 3. Define the Open-Loop System

L = C*G;

disp('Open-Loop Transfer Function:');
L

%% 4. Plot the Bode Diagram of the Plant

figure;
bode(G);
grid on;
title('Bode Plot of the Plant');

%% 5. Plot the Bode Diagram of the Open-Loop System

figure;
bode(L);
grid on;
title('Bode Plot of the Open-Loop System');

%% 6. Compare the Plant and Open-Loop Bode Diagrams

figure;
bode(G,L);
grid on;
legend('Plant G(s)','Open-Loop System K G(s)');
title('Bode Plot Comparison');

%% 7. Display Open-Loop Poles and Zeros

open_loop_poles = pole(L);
open_loop_zeros = zero(L);

disp('Open-Loop Poles:');
disp(open_loop_poles);

disp('Open-Loop Zeros:');
disp(open_loop_zeros);

%% 8. Create the Closed-Loop System

T = feedback(L,1);

disp('Closed-Loop Transfer Function:');
T

%% 9. Plot the Closed-Loop Bode Diagram

figure;
bode(T);
grid on;
title('Bode Plot of the Closed-Loop System');
