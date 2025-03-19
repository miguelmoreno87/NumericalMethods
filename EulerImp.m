function [t,y] = EulerImp(f,a,b,n,y0)
% Método de Euler implícito para resolver una EDO de orden 1 en su forma 
% normal; y'(t)=f(t,y). 'f' se introduce como función anónima, 'a' y 'b' 
% son los nodos menor y mayor, respectivamente, 'n' es el número de intervalos 
% de discretización y 'y0' es la condición inicial y(t=a)=y0. La función
% devuelve el vector de nodos de la variable independiente y un vector con
% las aproximaciones de la solución y(t).

h = (b-a)/n;
t = a:h:b;
y = zeros(n+1,length(y0));
y(1) = y0;

for k=1:n
    g = @(x) x-y(k)-h*f(t(k+1),x);
    [y(k+1),~] = NewtonRaphson(g,1e-4,y(k),100);
end

end