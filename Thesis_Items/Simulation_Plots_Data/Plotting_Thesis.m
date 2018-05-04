%% Thesis Code Simulation Script
%
clear all

%%
% Load Table Data for Force/Thrust Curves

load('Speed_High_Linear_FF_OPT')
load('Speed_High_Linear_No_FF_2_OPT')
% j1 = [1,2,3];
% j2 = [5,6,4,7,8];
% j3 = [10,11,9,12];
j1 = [1];
j2 = [1];
figure(1)
clf()
rg = 255;
C = {[186/rg 18/rg 18/rg],[22/rg 135/rg 0/rg],[252/rg 172/rg 0/rg],[0/rg 29/rg 255/rg],[0/rg 128/rg 128/rg]}; % Plot Color Array
%   subplot(3,1,1)
% for i=1:length(j1)
%     plot(tc_lin{j1(i)},surgec_lin{j1(i)},'Color',C{i})
%     grid on
%     grid minor
%     hold on
% end
% xlim([0 180])
% hline = refline([0 1.5]);
% hline.Color = 'r';hline.LineStyle = '--';hline.LineWidth = 1.5;
% legend('Kp=1.0','Kp=10','Kp=100','1.5 m/s',...
%     'Location','bestoutside')
% % legend('Ki=100','Ki=250','Ki=500','Ki=750','Ki=1000','1.5 m/s',...
% %     'Location','bestoutside')
% xlabel('Time [s]')
% ylabel('Speed [m/s]')
% 
%     subplot(3,1,2)
% for i=1:length(j2)
% 
%     plot(tc_lin{j2(i)},surgec_lin{j2(i)},'Color',C{i})
%     grid on
%     grid minor
%     hold on
% end
% % xlim([9 15])
% 
% xlim([0 180])
% hline = refline([0 1.5]);
% hline.Color = 'r';hline.LineStyle = '--';hline.LineWidth = 1.5;
% % ylim([0 0.5])
% % xlim([0 30])
% xlabel('Time [s]')
% ylabel('Speed [m/s]')
% legend('Ki=0.01','Ki=0.1','Ki=1.0','Ki=10','Ki=100','1.50 m/s',...
%     'Location','bestoutside')
% % legend('Ki=100','Ki=250','Ki=500','Ki=750','Ki=1000','1.5 m/s',...
% %     'Location','bestoutside')
% 
%     subplot(3,1,3)
% for i=1:length(j3)
% 
%     plot(tc_lin{j3(i)},surgec_lin{j3(i)},'Color',C{i})
%     grid on
%     hold on
% end
% xlim([0 180])
%     grid minor
% % xlim([59 90])
% hline = refline([0 1.5]);
% hline.Color = 'r';hline.LineStyle = '--';hline.LineWidth = 1.5;
% % 
% 
% % xlim([0 30])
% legend('Kd=0.01','Kd=0.1','Kd=1.0','Kd=10','1.50 m/s',...
%     'Location','bestoutside')
% 
% xlabel('Time [s]')
% ylabel('Speed [m/s]')
% 
% set(gcf,'color','w');
% export_fig speed_high_FF.png -png -r300 -painters


% 
% Optimized Plots
plot(tc_lin{1},integc_lin{1},'Color',C{4},'LineWidth',1.5)
hold on
grid on
plot(tc_lin_FF{1},integc_lin_FF{1},'Color',C{2},'LineWidth',1.5)
% hline = refline([0 1.5]);
% hline.Color = 'r';hline.LineStyle = '--';hline.LineWidth = 1.2;
% 

xlim([0 20])
ylim([-12 20])
legend('Without Feed-Forward Compensation','With Feed-Forward Compensation',...
    'Location','se')

xlabel('Time [s]')
ylabel('Integrator Effect [-]')
grid minor

set(gcf,'color','w');
export_fig speed_high_opt_FF_INT.png -png -r300 -painters
