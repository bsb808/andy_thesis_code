Gain = [1   10  100 1   1   1   1   1   1   1   1   1   1;
        0   0   0   1   .01  .1 10  100 0   0   0   0   0;
        0   0   0   0   0   0   0   0   1   .01 .1  10  100];
    
yawc = {};

figure(1);
clf;
for i=1:length(Gain)
      Kp=Gain(1,i);Kd=Gain(2,i);Kd=Gain(3,i);
        sim('USV_2DOF_SS_tcurve_YAW_wPID')
      yawc{i} = yaw
      tc{i} = time;
        plot(time,yaw)
        hold on
        
    end

