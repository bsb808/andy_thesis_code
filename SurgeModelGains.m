
% h1=plot(tau/t_x,y, tau/t_x,SP)
% set(h1,'linewidth',LW) 
% grid
% xlabel('tau [s]')
% ylabel('y & SP')
% legend('y','SP','Location','southeast')
% axis([0 t_sim/t_x 0 1.5])
% title(['PID-control: K_P =',num2str(K_P),' [-] & tau_N = ',...
%     num2str(tau_N),' [s]'])
Gain = [100]';
Kd = 0;
Ki = 0; 1/inf;
    
surgec = {};

figure(1);
clf;
for i=1:length(Gain)
      Kp=Gain(i);
        sim('ZN_USV_2DOF_SS_tcurve_SURGE_wPID')
      surgec{i} = surge;
      tc{i} = time;
        plot(time,surge)
        hold on
        
    end

