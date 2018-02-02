%% Thesis Code Simulation Script
%
clear all
rosshutdown
%% 
% ROS Initialization

% Location of the ROS Master
URI='http://192.168.1.11:11311'
% Local IP Address
nodehost='192.168.131.174'
% Specify node name
nodename='matlab_kingfisher'

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
vo = 0.0; vf = 0.0; % Initial and Final Speed [m/s]
yo = 0; yf=0;   % Initial and Final Heading [rad]
drag_coeff=16.91; % Drag Coefficients
switch_case = 0; % Binary Switch for Feed Forward. [0,1]
% sim_time = 20; % Simulation Time


%% 
%

Kpy=30;Kiy=.01;Kdy=5;
Kps=1;Kis=1;Kds=1;
% sim('EXP_Controller_Coupled')
sim('EXP_YAW_TEST')
% sim('EXP_Controller_YAW')
% sim('EXP_Controller_SURGE')

% Plotting Variables
% rg = 255;
% C = {[186/rg 18/rg 18/rg],[22/rg 135/rg 0/rg],[252/rg 172/rg 0/rg],[0/rg 29/rg 255/rg]}; % Plot Color Array
% j=1.533;


kfhdc = {};


figure(1);
clf;

plot(time,kfhd,time,yawcmd)
hold on
xlabel('Time [s]')
ylabel('Kingfisher Heading [deg]')
title('Kingfisher Heading vs CMD')
legend('Kingfisher','Command','Location','se')
grid on
hold off

figure(2);
clf;
hold on
plot(time,srgcmd,time,kfspd)
xlabel('Time [s]')
ylabel('Speed [m/s]')
title('Kingfisher Speed vs Command')
legend('Kingfisher','Command','Location','se')
grid on
hold off

Yaw_Gains = [Kpy Kiy Kdy];
Surge_Gains = [Kps Kis Kds];
YawMat = [time' kfhd' yawcmd'];
SurgeMat = [time' srgcmd' kfspd'];
save('02FEB_LakeTest_Run1','Yaw_Gains','Surge_Gains','YawMat','SurgeMat')

rosshutdown