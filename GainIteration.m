%% Thesis Code Simulation Script
%
clear all
%%
% Load Table Data for Force/Thrust Curves
data = csvread('tcurve_nohead.csv');
breakpoints1=data(end:-1:1,1)';
table_data = data(end:-1:1,2)';

%%
% Variable and Constant Initiation and Definition
% Step Inputs
vo = 0; vf=0.25; % Initial and Final Speed [m/s]
yo = 0; yf=0;    % Initial and Final Heading [rad]
drag_coeff=16.91; % Drag Coefficients
switch_case = 1; % Binary Switch for Feed Forward. [0,1]
sim_time = 60; % Simulation Time

%% 
% Gain Matrix for Testing
Gain = [1   10  100 1   1   1   1   1   1   1   1   1   1   100 100 100 100 100;
        0   0   0   1   .01  .1 10  100 0   0   0   0   0   1   .01 .1  10  100;
        0   0   0   0   0   0   0   0   1   .01 .1  10  100 .01 .01 .01 .01 .01];
    
Gain = [ 10 10 10 10;
         1 .01 .1 10;
         .01 .01 .01 .01];

surgec = {};
S = {};
rtime={};stime={};os={};sserr={};
ss_des = vf;
switch_1 = 1;
figure(1);
clf;
for i=1:length(Gain)
      Kp=Gain(1,i);Ki=Gain(2,i);Kd=Gain(3,i);
        sim('USV_2DOF_SS_tcurve_SURGE_wPID_FF_curves')
      surgec{i} = surge;
      S{i}=stepinfo(surge,time);
      rtime{i}=S{1,i}.RiseTime;
      stime{i}=S{1,i}.SettlingTime;
      os{i}=S{1,i}.Overshoot;
      sserr{i}=(ss_des-surge(end));
      tc{i} = time;
        plot(time,surge)
        hold on
end

Ch = [rtime' stime' os' sserr']
% legend('1','2','3','4','Location','se')