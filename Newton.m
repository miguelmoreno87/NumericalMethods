function [k,x_opt,min]=Newton(f,Df,H,x,eps)
% Se halla el mínimo de un campo escalar 'f' de variables reales 
% introducido como función anónima, dado un punto inicial (array columna)
% 'x'. Como argumentos también deben pasarse el gradiente de la función 
% 'Df' y  su matriz Hessiana 'H', también como funciones anónimas. 
% Por ejemplo:
% Df = @(x) [4*(x(1)-2)^3; 2*x(1)*x(2)] (Vector columna)
% 'eps' es la tolerancia. 
% Se devuelve el número de iteraciones empleado 'k', el óptimo 'x_opt' y 
% el mínimo valor de la función 'min'.

k = 0;
norm = sqrt(Df(x)'*Df(x)); % Norma del gradiente

% Se establece un número máximo de iteraciones
while norm > eps && k < 100
    k = k + 1;
    p = -H(x)\Df(x);
    x = x + p;
    norm = sqrt(Df(x)'*Df(x));
end

x_opt = x;
min = f(x_opt);

end