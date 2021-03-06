%% SURGE MODEL

%% DATA OBTAINED FROM SIMULINK MODEL TESTING
thr_cmd = .1:.1:1;
vel = [.1884 .3608 .6966 .9358 1.1187 1.3054 1.5268 1.5612 1.5647 1.5499];
thru_force = 2.*([0.3 1.1 4.1 7.4 10.5 14.4 19.7 20.6 20.7 20.3]);

%% FIT DATA FROM MANZINI THESIS
p1 = 23.24; p2 = -10.04; p3 = 1.395;
a1 = 21.62; b1 = -6.736;
a2 = 16.91;

poly = @(x) (p1.*(x.^2))+(p2.*x)+p3;
lin_quad = @(x) (a1.*(x.^2))+(b1.*x);
quad = @(x) (a2.*(x.^2));

x = linspace(0,1.6,100);
subplot(2,1,1)
scatter(vel,thru_force)
hold on
plot(x,poly(x))
plot(x,lin_quad(x))
plot(x,quad(x))
title('Surge Model Verification')
xlabel('Velocity [m/s]')
ylabel('Force from Two Thrusters [N]')
legend('From Quad Model','Poly Fit','Quadratic w/ Linear Fit','Quadratic Only Fit','location','se')
grid on

%% YAW MODEL

%% DATA OBTAINED FROM SIMULINK MODEL TESTING
thr_cmd = .1:.1:1;
vel = [.0308 .059 .1139 .15298 .18228 .2134 .2497 .2553 .255956 .2535];
thru_force = 0.44.*([0.3 1.1 4.1 7.4 10.5 14.4 19.7 20.6 20.7 20.3]);

%% FIT DATA FROM MANZINI THESIS
p1 = 93.86; p2 = 10.35; p3 = -0.07664;
a1 = 97.15; b1 = 9.265;
a2 = 138.9;

poly = @(x) (p1.*(x.^2))+(p2.*x)+p3;
lin_quad = @(x) (a1.*(x.^2))+(b1.*x);
quad = @(x) (a2.*(x.^2));

x = linspace(0,.25,100);
subplot(2,1,2)
scatter(vel,thru_force)
hold on
plot(x,poly(x))
plot(x,lin_quad(x))
plot(x,quad(x))
title('Yaw Model Verification')
xlabel('Angular Velocity [rad/s]')
ylabel('Torque [N-m]')
legend('From Quad Model','Poly Fit','Quadratic w/ Linear Fit','Quadratic Only Fit','location','se')
grid on

