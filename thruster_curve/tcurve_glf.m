function F = tcurve_glf(cmd,A,K,B,v,C,M,An,Kn,Bn,vn,Cn,Mn)

F = [];
for ii = 1:length(cmd)
    c = cmd(ii);
    if c > 0
        F(ii)=myglf(c,A,K,B,v,C,M);
    elseif c < 0
        F(ii)=myglf(c,An,Kn,Bn,vn,Cn,Mn);    
    else
        F(ii) = 0;
    end
    
    
end

function y=myglf(x,A,K,B,v,C,M)
y = A+ ( (K-A)./( (C+exp(-B*(x-M))).^(1/v) ) );

