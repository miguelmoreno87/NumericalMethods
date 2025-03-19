function [sol,iter,ACOC,incre1,incre2] = Ostrowski(fun,x0,tol,maxiter)
% Método iterativo de Ortrowski
% sol = Aproximación de la solución
% iter = Número de iteraciones empleadas
% ACOC = Aproximación del orden de complejidad
% incre1 = Error tipo 1 (separación entre aproximaciones consecutivas)
% incre2 = Error tipo 2 (separación entre la función y cero)
% fun = Función anónima con la función derivada (debe declararse como una
% función en un script)
% x0 = Aproximación inicial (!pasar como vpa(x0)!)
% tol = Tolerancia
% maxiter = Número máximo de iteraciones

digits(200)
x0=x0(:);
iter=0;
[fx0,dfx0]=feval(fun,x0);
incre1=tol+1;
incre2=tol+1;
p=[];
while (incre1+incre2)>tol && incre1>tol && iter<maxiter
    
    y=x0-fx0/dfx0;
    [fy,~]=feval(fun,y);
    x1=y-(fy/dfx0)*(fx0/(fx0-2*fy));
    
    % Actualización criterio de parada
    incre1=norm(x1-x0);
    p=[p incre1];
    x0=x1;
    [fx0,dfx0]=feval(fun,x0);
    incre2=norm(fx0);
    iter=iter+1;
end
% Cálculo de ACOC
ACOC=log(p(3:end)./p(2:end-1))./log(p(2:end-1)./p(1:end-2));
sol=x1;
incre1=vpa(incre1,6);
incre2=vpa(incre2,6);
ACOC=vpa(ACOC,6);
ACOC=ACOC(:);
sol=vpa(sol,10);
end
