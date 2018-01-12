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
vo = 2.5/2; vf = 2.5/2; % Initial and Final Speed [m/s]
yo = 0; yf=pi()/4;    % Initial and Final Heading [rad]
drag_coeff=16.91; % Drag Coefficients
switch_case = 0; % Binary Switch for Feed Forward. [0,1]
sim_time = 20; % Simulation Time

% Plotting Variables
rg = 255;
C = {[186/rg 18/rg 18/rg],[22/rg 135/rg 0/rg],[252/rg 172/rg 0/rg],[0/rg 29/rg 255/rg]}; % Plot Color Array


%% 
% Gain Matrix for Testing
Gain_S = [100 100 100 100;
        .01 20 100 500;
        0.01 0.01 0.01 0.01];
    
Gain_Y = [100 100 100 1000;
        0 .01 .01 .01;
        0 10 50 50];

surgec = {};
yawc = {};
S = {};
rtime={};stime={};os={};sserr={};
ss_des = 45;
figure(1);
clf;

for i=1:1
      Kps=Gain_S(1,i);Kis=Gain_S(2,i);Kds=Gain_S(3,i);
      j=1.533;
        for k=1:length(Gain_Y)
            Kpy=Gain_Y(1,k);Kiy=Gain_Y(2,k);Kdy=Gain_Y(3,k);
            sim('Coupled_USV_2DOF_SS_tcurve_wPID_FF_curves')
            yawc{k} = yaw;
%             S{k}=stepinfo(yaw,time);
%             rtime{k}=S{1,k}.RiseTime;
%             stime{k}=S{1,k}.SettlingTime;
%             os{k}=S{1,k}.Overshoot;
%             sserr{k}=(ss_des-yaw(end));
            tc{k} = time;
            j = j-(k/12);
            plot(time,yaw,'Color',C{k},'LineWidth',j)
            hold on
            grid on
        end
end
% 
% Ch = [rtime' stime' os' sserr'];

legend(['Kp=',num2str(Gain_Y(1,1)),', Ki=',num2str(Gain_Y(2,1)),', Kd=',num2str(Gain_Y(3,1))], ... 
    ['Kp=',num2str(Gain_Y(1,2)),', Ki=',num2str(Gain_Y(2,2)),', Kd=',num2str(Gain_Y(3,2))], ... 
    ['Kp=',num2str(Gain_Y(1,3)),', Ki=',num2str(Gain_Y(2,3)),', Kd=',num2str(Gain_Y(3,3))], ... 
    ['\bf Kp=',num2str(Gain_Y(1,4)),', Ki=',num2str(Gain_Y(2,4)),', Kd=',num2str(Gain_Y(3,4))], ...
    'Location','se')
xlabel('Time [s]')
ylabel('Heading [deg]')