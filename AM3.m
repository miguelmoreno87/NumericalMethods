function [t,y] = AM3(f,a,b,n,y0)
% Método de Adams-Moulton 3 para resolver una EDO de orden 1 en su forma 
% normal; y'(t)=f(t,y). 'f' se introduce como función anónima, 'a' y 'b' 
% son los nodos menor y mayor, respectivamente, 'n' es el número de intervalos 
% de discretización y 'y0' es la condición inicial y(t=a)=y0. La función
% devuelve el vector de nodos de la variable independiente y un vector con
% las aproximaciones de la solución y(t).

h = (b-a)/n;
t = a:h:b;
y = zeros(n+1,length(y0));
y(1) = y0;
max_iter = 10;
tol = 1e-6;

% Primer paso con método de Heun
y(2) = y(1) + 0.5*h*f(t(1),y(1))+0.5*h*f(t(1),y(1)+h*f(t(1),y(1)));

for k=2:n
    g = @(x) x-y(k)-(h/12)*(-f(t(k-1),y(k-1))+8*f(t(k),y(k))+5*f(t(k+1),x));
    [y(k+1),~] = NewtonRaphson(g,tol,y(k),max_iter);
end

t = t'; % Conversión a matriz columna

end