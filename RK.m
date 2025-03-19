function [t,y] = RK(f,a,b,n,y0)
% Método de Runge-Kutta para resolver un sistema de EDOs en su forma normal;
% y'(t)=f(t,y). 'f' se introduce como función anónima, 'a' y 'b' son los
% nodos menor y mayor, respectivamente, 'n' es el número de intervalos de
% discretización e 'y0' es la condición inicial y(t=a)=y0. La función
% devuelve el vector de nodos de la variable independiente y una matriz con
% las aproximaciones de la solución y(t), donde cada columna corresponde a 
% cada componente de la solución.
% IMPORTANTE: La función 'f' se debe introducir como una matriz fila, al
% igual que la condición inicial 'y0'.

h = (b-a)/n;
t = a:h:b;
y = zeros(n+1,length(y0));
y(1,:) = y0;

for k=1:n
    k1 = f(t(k), y(k,:));
    k2 = f(t(k)+0.5*h, y(k,:)+0.5*h*k1);
    k3 = f(t(k)+0.5*h, y(k,:)+0.5*h*k2);
    k4 = f(t(k+1), y(k,:)+h*k3);
    y(k+1,:) = y(k,:) + (h/6)*(k1+2*k2+2*k3+k4);
end

t = t'; % Conversión a matriz columna

end