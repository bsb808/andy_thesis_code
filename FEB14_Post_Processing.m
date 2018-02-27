%% Lake Testing Post Processing
%

%%
% Cell Array Structure Creation for Data Runs

load('Feb14_LakeTest_Compiled_Data_trimmed.mat')

% MInitVar{i}=InitVar';
% MSurgeGains{i}=Surge_Gains';
% MYawGains{i}=Yaw_Gains';
% MTime{i}=time';
% Mkfhd{i}=kfhd';
% Mkfspd{i}=kfspd';
% Mportcmd{i}=portcmd';
% Msrgcmd{i}=srgcmd';
% Mstbdcmd{i}=stbdcmd';
% Myawcmd{i}=yawcmd';

%%
% Plotting
% Plotting Variables
% rg = 255;
% C = {[186/rg 18/rg 18/rg],[22/rg 135/rg 0/rg],[252/rg 172/rg 0/rg],[0/rg 29/rg 255/rg]}; % Plot Color Array

figure(1);
clf;

for i=25:28
      time = MTime{i};
%       kfhd = abs(Mkfhd{i});
%       yawcmd = abs(Myawcmd{i});
      yawcmd = Myawcmd{i};
      kfhd = Mkfhd{i};
% 
%      time = time(291:end)-29;
%      MTime{i} = time;
% 
%      kfhd = kfhd-yawcmd(1);
%      kfhd = kfhd(291:end);
%      Mkfhd{i}=kfhd;
% 
%      yawcmd = abs(yawcmd-yawcmd(1));
%      yawcmd = yawcmd(291:end);
%      Myawcmd{i}=yawcmd;
%       plot(time,kfhd,time,yawcmd)
      plot(time,kfhd)
      hold on
      grid on
end

xlabel('Time [s]')
ylabel('Kingfisher Heading [deg]')
title('Kingfisher Heading vs CMD')
% legend('1','2','3','4','5','6','7','8','9','10','11','12','13','14','15',...
%     '16','17','18','19','20','21','22','23','24','25','26','27','28','Location','se')

grid on
hold off
% 
figure(2);
clf;
for i=25:28
      time = MTime{i};
      srgcmd = Msrgcmd{i};
      kfspd = Mkfspd{i};
%       kfspd = kfspd(291:end);
%       Mkfspd{i}=kfspd;
%       srgcmd = Msrgcmd{i};
%       srgcmd = srgcmd(291:end);
%       Msrgcmd{i}=srgcmd;
      hold on
      plot(time,srgcmd,time,kfspd)
%       plot(time,kfspd)
      grid on
end
xlabel('Time [s]')
ylabel('Speed [m/s]')
title('Kingfisher Speed vs Command')
% legend('10','11','Location','sw')
hold off
% % 
clear i kfhd kfspd srgcmd time yawcmd ans
save('Feb14_LakeTest_Compiled_Data_trimmed')



% legend(['Kp=',num2str(MYawGains(1,1)),' Kd=',num2str(MYawGains(3,1))], ... 
%     ['Kp=',num2str(Gain_Y(1,2)),', Ki=',num2str(Gain_Y(2,2)),', Kd=',num2str(Gain_Y(3,2))], ... 
%     ['Kp=',num2str(Gain_Y(1,3)),', Ki=',num2str(Gain_Y(2,3)),', Kd=',num2str(Gain_Y(3,3))], ... 
%     ['\bf Kp=',num2str(Gain_Y(1,4)),', Ki=',num2str(Gain_Y(2,4)),', Kd=',num2str(Gain_Y(3,4))], ...
%     'Location','se')




% legend(['Kp=',num2str(MYawGains(1,1)),' Kd=',num2str(MYawGains(3,1))], ... 
%     ['Kp=',num2str(Gain_Y(1,2)),', Ki=',num2str(Gain_Y(2,2)),', Kd=',num2str(Gain_Y(3,2))], ... 
%     ['Kp=',num2str(Gain_Y(1,3)),', Ki=',num2str(Gain_Y(2,3)),', Kd=',num2str(Gain_Y(3,3))], ... 
%     ['\bf Kp=',num2str(Gain_Y(1,4)),', Ki=',num2str(Gain_Y(2,4)),', Kd=',num2str(Gain_Y(3,4))], ...
%     'Location','se')
% 
% figure(3);
% subplot(2,2,1)
% hold on
% plot(time,srgcmd)
% xlabel('Time [s]')
% ylabel('Surge Setpoint [m/s]')
% title('Speed Setpoint vs Time')
% legend('Command','Location','se')
% grid on
% subplot(2,2,2)
% hold on
% plot(time,srgcmd,time,kfspd)
% xlabel('Time [s]')
% ylabel('Speed [m/s]')
% title('Kingfisher Speed vs Commanded')
% legend('Command','Kingfisher','Location','se')
% grid on
% subplot(2,2,3)
% hold on
% plot(time,yawcmd)
% xlabel('Time [s]')
% ylabel('Heading Setpoint [deg]')
% title('Heading Setpoint vs Time')
% legend('Command','Location','se')
% grid on
% subplot(2,2,4)
% hold on
% plot(time,yawcmd,time,kfhd)
% hold on
% xlabel('Time [s]')
% ylabel('Kingfisher Heading [deg]')
% title('Kingfisher Heading vs Commanded')
% legend('Command','Kingfisher','Location','se')
% grid on
% hold off
% 
% figure(4);
% hold on
% plot(time,portcmd,time,stbdcmd)
% xlabel('Time [s]')
% ylabel('Motor Command [-1 to 1]')
% title('Motor Commands vs Time')
% legend('Port Command','Starboard Command','Location','se')
% grid on
% 
% 
% figure(5);
% hold on
% plot(time,surgeint)
% xlabel('Time [s]')
% ylabel('Integrator Effect]')
% title('Surge Integrator vs Time')
% legend('Integrator','Location','se')
% grid on
% 
% for i=1:length(C)
%       Kps=Gain_S(1,i);Kis=Gain_S(2,i);Kds=Gain_S(3,i);
%       j=1.533;
%       Kpy=Gain_Y(1,k);Kiy=Gain_Y(2,k);Kdy=Gain_Y(3,k);
%       S{k}=stepinfo(yaw,time);
% %             rtime{k}=S{1,k}.RiseTime;
% %             stime{k}=S{1,k}.SettlingTime;
% %             os{k}=S{1,k}.Overshoot;
% %             sserr{k}=(ss_des-yaw(end));
%             tc{k} = time;
%             j = j-(k/12);
%             plot(time,yaw,'Color',C{k},'LineWidth',j)
%             hold on
%             grid on
% end
% % 
% % Ch = [rtime' stime' os' sserr'];
% 
% legend(['Kp=',num2str(Gain_Y(1,1)),', Ki=',num2str(Gain_Y(2,1)),', Kd=',num2str(Gain_Y(3,1))], ... 
%     ['Kp=',num2str(Gain_Y(1,2)),', Ki=',num2str(Gain_Y(2,2)),', Kd=',num2str(Gain_Y(3,2))], ... 
%     ['Kp=',num2str(Gain_Y(1,3)),', Ki=',num2str(Gain_Y(2,3)),', Kd=',num2str(Gain_Y(3,3))], ... 
%     ['\bf Kp=',num2str(Gain_Y(1,4)),', Ki=',num2str(Gain_Y(2,4)),', Kd=',num2str(Gain_Y(3,4))], ...
%     'Location','se')
% xlabel('Time [s]')
% ylabel('Heading [deg]')