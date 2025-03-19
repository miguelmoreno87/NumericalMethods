function [x,k]=NewtonRaphson2(f,h,x0,max_iter)
% Función que implementa el método iterativo de Newton-Raphson para
% calcular el cero simple de una función continuamente diferenciable en un
% entorno de este. Toma por argumentos la función objetivo 'f' como función
% anónima, la tolerancia 'h' con la que se encuentra la solución y el punto
% inicial 'x0' por el que se comienza a buscar. La función devuelve la
% aproximación del valor donde ocurre el cero, 'x', y el número de
% iteraciones empleadas 'k'. Se fija un número máximo de iteraciones,
% 'max_iter'.

x = x0;
k = 1;

% Se crea una variable auxiliar simbólica, 'y', para calcular la derivada
% de la función 'f'.
syms y
g(y) = f(y);
dev_f1 = diff(g,y,1);
dev_f2 = diff(g,y,2); 

% Proceso iterativo
while abs(f(x)) > h && k < max_iter
    x = x - double(dev_f1(x))/double(dev_f2(x));
    k = k + 1;
end

end