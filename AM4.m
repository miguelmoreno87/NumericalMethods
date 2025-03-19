function [t,y] = AM4(f,a,b,n,y0)
% Método de Adams-Moulton 4 para resolver una EDO de orden 1 en su forma 
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

% Primeros pasos con el método de Runge-Kutta
for k=1:2
    k1 = f(t(k), y(k,:));
    k2 = f(t(k)+0.5*h, y(k,:)+0.5*h*k1);
    k3 = f(t(k)+0.5*h, y(k,:)+0.5*h*k2);
    k4 = f(t(k+1), y(k,:)+h*k3);
    y(k+1,:) = y(k,:) + (h/6)*(k1+2*k2+2*k3+k4);
end

% Método de AM4
for k=3:n
    g = @(x) x-y(k)-(h/24)*(f(t(k-2),y(k-2))-5*f(t(k-1),y(k-1))+...
        19*f(t(k),y(k))+9*f(t(k+1),x));
    [y(k+1),~] = NewtonRaphson(g,tol,y(k),max_iter);
end

t = t'; % Conversión a matriz columna

end