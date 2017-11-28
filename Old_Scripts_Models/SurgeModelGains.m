Kp=1;
('usv_2dof_quad_drag_ssmethod_tcurve')
figure(1);
clf;
subplot(1,2,1)
plot(time,surge)
subplot(1,2,2)
plot(time,surge)
xlim([0 .1])
ylim([0 .1])

d1y = gradient(surge,time);             % Numerical Derivative
d2y = del2(surge,time);                 % Numerical Second Derivative
t_infl = interp1(d1y, time, max(d1y));  % Find ‘t’ At Maximum Of First Derivative
y_infl = interp1(time, surge, t_infl);  % Find ‘y’ At Maximum Of First Derivative
slope  = interp1(time, d1y, t_infl);    % Slope Defined Here As Maximum Of First Derivative
intcpt = y_infl - slope*t_infl;         % Calculate Intercept
tngt = slope*time + intcpt;             % Calculate Tangent Line

figure(2)
plot(time, surge)
hold on
plot(time, tngt, '-r', 'LineWidth',1)        % Plot Tangent Line
plot(t_infl, y_infl, 'bp')                   % Plot Maximum Slope
hold off
grid
legend('y(t)', 'Tangent', 'Location','E')
xlim([0 1])
K = max(surge);
T1 = -intcpt/slope;
T2 = (K-intcpt)/slope - T1;