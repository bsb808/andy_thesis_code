%% Lake Testing Post Processing
%

%%
% Cell Array Structure Creation for Data Runs

load('Feb14_LakeTest_Compiled_Data.mat')

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
for i=1:4
      time = MTime{i};
      kfhd = Mkfhd{i};
      yawcmd = Myawcmd{i};
      plot(time,kfhd,time,yawcmd)
      hold on
      grid on
end
% legend(['Kp=',num2str(MYawGains(1,1)),' Kd=',num2str(MYawGains(3,1))], ... 
%     ['Kp=',num2str(Gain_Y(1,2)),', Ki=',num2str(Gain_Y(2,2)),', Kd=',num2str(Gain_Y(3,2))], ... 
%     ['Kp=',num2str(Gain_Y(1,3)),', Ki=',num2str(Gain_Y(2,3)),', Kd=',num2str(Gain_Y(3,3))], ... 
%     ['\bf Kp=',num2str(Gain_Y(1,4)),', Ki=',num2str(Gain_Y(2,4)),', Kd=',num2str(Gain_Y(3,4))], ...
%     'Location','se')
xlabel('Time [s]')
ylabel('Kingfisher Heading [deg]')
title('Kingfisher Heading vs CMD')
legend('1','1cmd','2','2cmd','3','3cmd','4','4cmd','Location','sw')
% ,'5','5cmd'
grid on
hold off
% 
% figure(2);
% clf;
% hold on
% plot(time,srgcmd,time,kfspd)
% xlabel('Time [s]')
% ylabel('Speed [m/s]')
% title('Kingfisher Speed vs Command')
% legend('Command','Kingfisher','Location','se')
% grid on
% hold off
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