switch_case = [0 1];
surgec = {};

figure(1);
clf;
for i=1:length(switch_case)
      switch_1=switch_case(i)
      sim('USV_2DOF_SS_tcurve_SURGE_wPID_FF')
      surgec{i} = surge
      tc{i} = time;
      plot(time,surge)
      hold on
end

grid on
legend('Without Feed Forward','With Feed Forward','Location','se')
xlabel('Time[s]')
ylabel('Speed[m/s]')
