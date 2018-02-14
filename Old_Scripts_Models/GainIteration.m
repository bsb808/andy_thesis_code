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
vo = 0.0; vf = 0.0; % Initial and Final Speed [m/s]
yo = 0; yf=pi()/4;    % Initial and Final Heading [rad]
drag_coeff=16.91; % Drag Coefficients
switch_case = 0; % Binary Switch for Feed Forward. [0,1]
sim_time = 12; % Simulation Time

% Plotting Variables
rg = 255;
C = {[186/rg 18/rg 18/rg],[22/rg 135/rg 0/rg],[252/rg 172/rg 0/rg],[0/rg 29/rg 255/rg]}; % Plot Color Array
j=1.533;

%% 
% Gain Matrix for Testing
% Gain = [1   10  100 1   1   1   1   1   1   1   1   1   1   100 100 100 100 100;
%         0   0   0   1   .01  .1 10  100 0   0   0   0   0   1   .01 .1  10  100;
%         0   0   0   0   0   0   0   0   1   .01 .1  10  100 .01 .01 .01 .01 .01];
%     
Gain = [100 100 100 1000;
        0 .01 .01 .01;
        0 10 50 50];

surgec = {};
S = {};
rtime={};stime={};os={};sserr={};
ss_des = 45;
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
      j = j-(i/12);
      plot(time,surge,'Color',C{i},'LineWidth',j)
      hold on
      grid on
end

Ch = [rtime' stime' os' sserr'];

legend(['Kp=',num2str(Gain(1,1)),', Ki=',num2str(Gain(2,1)),', Kd=',num2str(Gain(3,1))], ... 
    ['Kp=',num2str(Gain(1,2)),', Ki=',num2str(Gain(2,2)),', Kd=',num2str(Gain(3,2))], ... 
    ['Kp=',num2str(Gain(1,3)),', Ki=',num2str(Gain(2,3)),', Kd=',num2str(Gain(3,3))], ... 
    ['\bf Kp=',num2str(Gain(1,4)),', Ki=',num2str(Gain(2,4)),', Kd=',num2str(Gain(3,4))], ...
    'Location','se')
xlabel('Time [s]')
ylabel('Heading [deg]')