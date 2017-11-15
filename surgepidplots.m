%% SURGE PID MODEL PLOTS

subplot(3,2,1)
plot(surge1)
title('No Controller')
xlabel('Time [s]')
ylabel('Velocity [m/s]')
grid on
legend('Kp=0 Ki=0 Kd=0','location','nw')

subplot(3,2,2)
plot(surge2)
hold on
plot(surge21)
plot(surge22)
title('Proportional Controller')
xlabel('Time [s]')
ylabel('Velocity [m/s]')
grid on
legend('Kp=1','Kp=10','Kp=0.1','location','nw')

subplot(3,2,3)
plot(surge3)
hold on
plot(surge31)
plot(surge32)
title('PI Controller - Kp=1')
xlabel('Time [s]')
ylabel('Velocity [m/s]')
grid on
legend('Ki=1','Ki=10','Ki=0.1','location','nw')

subplot(3,2,4)
plot(surge4)
hold on
plot(surge41)
plot(surge42)
title('PD Controller - Kp=1')
xlabel('Time [s]')
ylabel('Velocity [m/s]')
grid on
legend('Kd=1','Kd=10','Kd=0.1','location','nw')

subplot(3,2,5)
plot(surge5)
hold on
plot(surge51)
plot(surge52)
plot(surge53)
plot(surge54)
title('PID Controller - Kp=1')
xlabel('Time [s]')
ylabel('Velocity [m/s]')
grid on
legend('Ki=1 Kd=1','Ki=1 Kd=10','Ki=1 Kd=.1','Ki=.1 Kd=1','Ki=10 Kd=1','location','nw')

%% YAW PD MODEL PLOTS

figure(2)
plot(yaw)
title('Yaw PD Controller')
xlabel('Time [s]')
ylabel('Angle [rad]')
grid on
legend('Kp=1 Ki=0 Kd=10','location','se')