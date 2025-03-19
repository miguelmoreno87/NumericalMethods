function [sol,iter,ACOC,incre1,incre2] = Steffensen(fun,x0,tol,maxiter)
% Método iterativo de Steffensen
% sol = Aproximación de la solución
% iter = Número de iteraciones empleadas
% ACOC = Aproximación del orden de complejidad
% incre1 = Error tipo 1 (separación entre aproximaciones consecutivas)
% incre2 = Error tipo 2 (separación entre la función y cero)
% fun = Función anónima con la función derivada (debe declararse como una
% función en un script)
% x0 = Aproximación inicial (!pasar como vpa(x0)!))
% tol = Tolerancia
% maxiter = Número máximo de iteraciones

digits(200)
iter=0;
incre1=tol+1;
incre2=tol+1;
I=[];
[fx0,~]=feval(fun,x0);
while incre2+incre1>tol && iter<maxiter
    
    w=x0+fx0;
    [fw,~]=feval(fun,w);
    dif=(fx0-fw)/(x0-w);
    x1=x0-fx0/dif;
    
    % Actualización criterio de parada
    incre1=abs(x1-x0);
    I(iter+1)=incre1;
    x0=x1;
    [fx0,~]=feval(fun,x0);
    incre2=norm(fx0);
    iter=iter+1;

end
if incre1+incre2<tol
    sol=x0;
    ACOC=log(I(3:end)./I(2:end-1))./log(I(2:end-1)./I(1:end-2));
else
    disp('necesito más iteraciones')
end
    ACOC=vpa(ACOC,10);
    ACOC=ACOC(:);
    inc=incre1+incre2;
    inc=vpa(inc,10);
end

