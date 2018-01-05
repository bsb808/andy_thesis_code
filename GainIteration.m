

% Gain = [1   10  100 1   1   1   1   1   1   1   1   1   1   100 100 100 100 100;
%         0   0   0   1   .01  .1 10  100 0   0   0   0   0   1   .01 .1  10  100;
%         0   0   0   0   0   0   0   0   1   .01 .1  10  100 .01 .01 .01 .01 .01];
    
Gain = [ 20 40 60 80;
         10 10 10 10;
         .1 .1 .1 .1];
surgec = {};
S = {};
rtime={};stime={};os={};sserr={};
ss_des = 1.5;
switch_1 = 1;
figure(1);
clf;
for i=1:length(Gain)
      Kp=Gain(1,i);Ki=Gain(2,i);Kd=Gain(3,i);
        sim('USV_2DOF_SS_tcurve_SURGE_wPID_FF')
      surgec{i} = surge;
      S{i}=stepinfo(surge,time,1.5);
      rtime{i}=S{1,i}.RiseTime;
      stime{i}=S{1,i}.SettlingTime;
      os{i}=S{1,i}.Overshoot;
      sserr{i}=(ss_des-surge(end));
      tc{i} = time;
        plot(time,surge)
        hold on
end

Ch = [rtime' stime' os' sserr']
legend('1','2','3','4','Location','se')