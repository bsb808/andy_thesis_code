% Thesis Code Simulation Script

clear all
rosshutdown
% 
% ROS Initialization

% Location of the ROS Master
URI='http://192.168.1.11:11311'
% Local IP Address
nodehost='192.168.131.174'
% Specify node name
nodename='matlab_kingfisher_7'

% Initialize
rosinit(URI,'NodeHost',nodehost,'NodeName',nodename)
%%
% Load Table Data for Force/Thrust Curves
data = csvread('tcurve_nohead.csv');
breakpoints1=data(end:-1:1,1)';
table_data = data(end:-1:1,2)';


%%
% Variable and Constant Initiation and Definition
% Step Inputs
vo = 0.0; vf = 0.25; % Initial and Final Speed [m/s]
yo = 0; yf = 0;   % Initial and Final Heading [rad]
% yo = pi+(-1.6-(pi/4)); yf = yo+(pi/4);   % Initial and Final Heading [rad]
drag_coeff= 16.91; % Drag Coefficients. Original 16.91
switch_case = 1; % Binary Switch for Feed Forward. [0,1]
% sim_time = 20; % Simulation Time

InitVar = [vo vf yo yf drag_coeff switch_case];
% %%
% 
Kpy=0;  Kiy=0; Kdy=0; %% Yaw Gains

Kps=40;  Kis=15;   Kds=0; %% Surge Gains
% 
% sim('EXP_Controller_Coupled')
% sim('EXP_YAW_TEST')
% sim('EXP_Controller_YAW')
sim('EXP_Controller_SURGE')

% Plotting Variables
% rg = 255;
% C = {[186/rg 18/rg 18/rg],[22/rg 135/rg 0/rg],[252/rg 172/rg 0/rg],[0/rg 29/rg 255/rg]}; % Plot Color Array
% j=1.533;

% 
% figure(1);
% clf;
% 
% plot(time,kfhd,time,yawcmd)
% hold on
% xlabel('Time [s]')
% ylabel('Kingfisher Heading [deg]')
% title('Kingfisher Heading vs CMD')
% legend('Kingfisher','Command','Location','se')
% grid on
% hold off

figure(2);
clf;
hold on
plot(time,srgcmd,time,kfspd)
xlabel('Time [s]')
ylabel('Speed [m/s]')
title('Kingfisher Speed vs Command')
legend('Command','Kingfisher','Location','se')
grid on
hold off

% figure(3);
% subplot(2,2,1)
% hold on
% plot(time,srgcmd)
% xlabel('Time [s]')
% ylabel('Surge Setpoint [m/s]')
% title('Speed Setpoint vs Time')
% legend('Command','Location','se')
% grid on
% subplot(2,2,2)
% hold on
% plot(time,srgcmd,time,kfspd)
% xlabel('Time [s]')
% ylabel('Speed [m/s]')
% title('Kingfisher Speed vs Commanded')
% legend('Command','Kingfisher','Location','se')
% grid on
% subplot(2,2,3)
% hold on
% plot(time,yawcmd)
% xlabel('Time [s]')
% ylabel('Heading Setpoint [deg]')
% title('Heading Setpoint vs Time')
% legend('Command','Location','se')
% grid on
% subplot(2,2,4)
% hold on
% plot(time,yawcmd,time,kfhd)
% hold on
% xlabel('Time [s]')
% ylabel('Kingfisher Heading [deg]')
% title('Kingfisher Heading vs Commanded')
% legend('Command','Kingfisher','Location','se')
% grid on
% hold off

figure(4);
hold on
plot(time,portcmd,time,stbdcmd)
xlabel('Time [s]')
ylabel('Motor Command [-1 to 1]')
title('Motor Commands vs Time')
legend('Port Command','Starboard Command','Location','se')
grid on


figure(5);
hold on
plot(time,surgeint)
xlabel('Time [s]')
ylabel('Integrator Effect]')
title('Surge Integrator vs Time')
legend('Integrator','Location','se')
grid on

Yaw_Gains = [Kpy Kiy Kdy];
Surge_Gains = [Kps Kis Kds];
save('28FEB_LakeTest_Run31','Surge_Gains','Yaw_Gains','time', ... 
    'srgcmd','kfspd','portcmd','stbdcmd','InitVar','surgeint')

% save('28FEB_LakeTest_Run1','Surge_Gains','Yaw_Gains','time','yawcmd','kfhd' ... 
%     ,'srgcmd','kfspd','portcmd','stbdcmd','InitVar','surgeint')

rosshutdown