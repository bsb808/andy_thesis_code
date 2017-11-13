function err=glf_pos(params,data,A,K)
% Generalized logistic function for fminsearch fitting

xx = data(:,1);
yy = data(:,2);
% Fixed 
A = A;  
K = K;
% Varied
B = params(1);
v = params(2);
C = params(3);
M = params(4);

Y = A+ ( (K-A)./( (C+exp(-B*(xx-M))).^(1/v) ) );
err = sqrt( sum((yy-Y).^2) );
% weight the error at zero and at the end
err = err + 5*abs(Y(1))+5*sqrt(sum((Y(end-3:end)-K).^2))/4;


