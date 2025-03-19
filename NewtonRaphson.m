function [x,k]=NewtonRaphson(f,h,x0,max_iter)
% Función que implementa el método iterativo de Newton-Raphson para
% calcular el cero simple de una función continuamente diferenciable en un
% entorno de este. Toma por argumentos la función objetivo 'f' como función
% anónima, la tolerancia 'h' con la que se encuentra la solución y el punto
% inicial 'x0' por el que se comienza a buscar. La función devuelve la
% aproximación del valor donde ocurre el cero, 'x', y el número de
% iteraciones empleadas 'k'.

x = x0;
k = 1;

% Inicialización arbitaria del error
error = 1 + h;

% Se crea una variable auxiliar simbólica, 'y', para calcular la derivada
% de la función 'f'.
syms y
g(y) = f(y);
dev_f = diff(g,y,1);

% Proceso iterativo
while (abs(f(x)) > h || error > h) && k < max_iter
    x_new = x - f(x)/double(dev_f(x));
    k = k + 1;
    error = abs(x_new - x);
    x = x_new;
end

end