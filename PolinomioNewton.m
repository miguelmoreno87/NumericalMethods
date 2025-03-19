function [b,p]=PolinomioNewton(xi,fi)
% Función que calcula el polinomio interpolador de Newton dado un conjunto
% de puntos (xi,fi). 'b' es un array con los coeficientes de Newton
% (diferencias divididas)y 'p' es el polinomio de Newton dado de forma
% simbólica. Los argumentos de entrada 'xi' y 'fi' también deben ser
% arrays.

% Ajuste de formato automático
format shortG

% Matriz donde se almacenan todas las diferencias divididas empleadas en el
% cálculo del polinomio. La primera fila de la matriz son los coeficientes
% 'b' de Newton. La primera columna son las diferencias divididas de orden
% cero, es decir el array 'fi'.
A = zeros(length(xi),length(xi));
A(:,1) = fi;

% Se define 'x' como una variable simbólica para devolver el polinomio
% también de forma simbólica
syms x
p = fi(1);

% vx = (x-x0)(x-x1)···(x-xk)
vx = 1;

% Cálculo de diferencias divididas
for k=2:length(fi)
    
    for i=1:(length(fi)-k+1)
        A(i,k) = (A(i+1,k-1) - A(i,k-1))/(xi(k)-xi(1));
    end
    
    vx = vx*(x-xi(k-1));
    p = p+A(1,k)*vx;

end

b = A(1,:);

end