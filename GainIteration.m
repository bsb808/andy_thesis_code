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
vo = 1.25; vf =1.5; % Initial and Final Speed [m/s]
yo = 0; yf=0;    % Initial and Final Heading [rad]
drag_coeff=16.91; % Drag Coefficients
switch_case = 1; % Binary Switch for Feed Forward. [0,1]
sim_time = 30; % Simulation Time

% Plotting Variables
rg = 255;
C = {[186/rg 18/rg 18/rg],[22/rg 135/rg 0/rg],[252/rg 172/rg 0/rg],[0/rg 29/rg 255/rg]}; % Plot Color Array
j=1.533;

%% 
% Gain Matrix for Testing
% Gain = [1   10  100 1   1   1   1   1   1   1   1   1   1   ;
%         0   0   0   1   .01  .1 10  100 0   0   0   0   0  ;
%         0   0   0   0   0   0   0   0   1   .01 .1  10  100 ];
    
% Gain = [100 100 100 100 100 ;
%         100 250 500 750 1000;
%         .01 .01 .01 .01 .01];

Gain = [100;100;.01];
Kpy = 0; Kdy = 0; Kiy = 0;
surgec_lin_FF = {};
integc_lin_FF = {};
gainc_lin_FF = {};
tc_lin_FF = {};
S = {};
rtime={};stime={};os={};sserr={};
ss_des = 1.5;
figure(1);
clf;

for i=1
      Kps=Gain(1,i);Kis=Gain(2,i);Kds=Gain(3,i);
        sim('Coupled_USV_2DOF_SS_tcurve_wPID_FF_curves')
      surgec_lin_FF{i} = surge;
      S{i}=stepinfo(surge,time);
      rtime{i}=S{1,i}.RiseTime;
      stime{i}=S{1,i}.SettlingTime;
      os{i}=S{1,i}.Overshoot;
      sserr{i}=(ss_des-mean(surge((50:end))));
      tc_lin_FF{i} = time;
      integc_lin_FF{i} = integ;
      gainc_lin_FF{i} = [Kps, Kds, Kis];
%       j = j-(i/12);
%       plot(time,yaw,'Color',C{i},'LineWidth',j)
      figure(1)
      plot(time,surge)
      hold on
      grid on
end

Ch = [rtime' stime' os' sserr'];

legend('1','2','3','4','5','6','7','8','9','10','11','12','13',...
    'Location','se')
xlabel('Time [s]')
ylabel('Speed[m/s]')