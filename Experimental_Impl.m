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
yo = 0; yf=pi()/4;    % Initial and Final Heading [rad]
drag_coeff=16.91; % Drag Coefficients
switch_case = 0; % Binary Switch for Feed Forward. [0,1]
sim_time = 20; % Simulation Time


%% 
%

Kpy=1;Kiy=1;Kdy=1;
sim('EXP_Controller_YAW')

rosshutdown