Gain = [1   10  100 1   1   1   1   1   1   1   1   1   1;
        0   0   0   1   .01  .1 10  100 0   0   0   0   0;
        0   0   0   0   0   0   0   0   1   .01 .1  10  100];
    
surgec = {};
S = {};
figure(1);
clf;
for i=1:length(Gain)
      Kp=Gain(1,i);Kd=Gain(2,i);Kd=Gain(3,i);
        sim('USV_2DOF_SS_tcurve_SURGE_wPID')
      surgec{i} = surge;
      S{i}=stepinfo(surge);
      tc{i} = time;
        plot(time,surge)
        hold on
        
    end

