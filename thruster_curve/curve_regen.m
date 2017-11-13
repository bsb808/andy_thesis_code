load thurster_thrustcmd_fig17

figure(1)
plot(tht,meanF,'.')

% Print data sorted
[tt,ii] = sort(tht,'descend');
tt'
tt
ff = meanF(ii);
(ff/2)'

% Forward thrust
II = find(tht>=0);

[cc,JJ] = sort(tht(II));
ff = meanF(II);
ff = ff(JJ);
cmd = linspace(0,max(cc),100);

cmd = linspace(-10,10,1000);
A = 0;
K = 20;
B = 8;
v = 0.5;
C = 1;
M = 0.35;

cmd = linspace(-10,10,1000);
F = A+ ( (K-A)./( (C+exp(-B*(cmd-M))).^(1/v) ) );
%figure(5); clf;
%plot(cmd,F)

cmd = linspace(0,max(cc),100);
F = A+ ( (K-A)./( (C+exp(-B*(cmd-M))).^(1/v) ) );

A = 0;
K = 20;
p0 = [B,v,C,M];
data = [cc' (ff/2)'];
f = @(p)glf_pos(p,data,A,K);
pout = fminsearch(f,p0)

params = pout;
xx = linspace(-0.1,max(cc)*1.2,100);
B = params(1);
v = params(2);
C = params(3);
M = params(4);
Y = A+ ( (K-A)./( (C+exp(-B*(xx-M))).^(1/v) ) );

figure(3); clf;
plot(cc,ff/2,'o')
hold on 
%plot(cmd,F,'g-')
plot(xx,Y,'r-')
grid on;
legend('Data','Fit','location','NorthWest')
xlabel('Motor Command')
ylabel('Single Thruster Force')
title('Thruster Curve Fit - Forward')

% Reverse thrust
II = find(tht<=0);

[cc,JJ] = sort(tht(II));
ff = meanF(II);
ff = ff(JJ);

An = -6;
Kn = 0;
% Initial guess
Bn = 5;
vn = 1;
Cn = 1;
Mn = -0.6;

p0 = [Bn,vn,Cn,Mn];
data = [cc' (ff/2)'];
f = @(p)glf_neg(p,data,An,Kn);
pout = fminsearch(f,p0)

params = pout;
xx = linspace(min(cc)*1.2,max(cc)*1.2,100);
Bn = params(1);
vn = params(2);
Cn = params(3);
Mn = params(4);

Y = An+ ( (Kn-An)./( (Cn+exp(-Bn*(xx-Mn))).^(1/vn) ) );

figure(4); clf;
plot(cc,ff/2,'o')
hold on 
%plot(cmd,F,'g-')
plot(xx,Y,'r-')
grid on;
legend('Data','Fit','location','NorthWest')
xlabel('Motor Command')
ylabel('Single Thruster Force')
title('Thruster Curve Fit - Reverse')

%%
% Plot it all
figure(2)
clf()
err = errorbar(tht, meanF/2, stdF/2, 'bo');
err.MarkerSize = 2;
%title('Thrust Command Relationship')
xlabel('Thrust Command [-1 to 1]')
ylabel('Thrust of Single Thruster [N]')
cmd = linspace(min(tht)*1.1,max(tht)*1.1,100);
y = tcurve_glf(cmd,A,K,B,v,C,M,An,Kn,Bn,vn,Cn,Mn);
hold on
plot(cmd,y,'r-')
grid on
axis tight

