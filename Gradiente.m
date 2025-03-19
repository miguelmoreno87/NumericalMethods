function [k,x_opt,min]=Gradiente(f,Df,x,eps,opcion)
% Se determina un mínimo local de un campo escalar 'f' de variables reales
% utilizando el método de descenso del gradiente. Se pasa como argumentos
% la función objetivo 'f' como función anónima, el gradiente de la función
% 'Df' como función anónima (es un vector columna), el punto inicial 'x' y
% la tolerancia 'eps'. Se devuelve el número de iteraciones, el óptimo y el
% mínimo valor de la función objetivo.

k = 0;
norm = sqrt(Df(x)'*Df(x));

% Se establece un máximo de iteraciones
while norm > eps && k < 100
    k = k + 1;

    % Función anónima de una sola variable
    g = @(t)f(x-t*Df(x)');

    % Se resuelve el problema de optimización unidimensional empleando el
    % método de búsqueda de la sección áurea si opcion == 1. En otro caso,
    % se emplea el método de Newton-Raphson unidimensional.
    if opcion == 1
        [t_opt,~,~] = SeccionAurea2(g,1e-3,0,0.01);
    else
        [t_opt,~] = NewtonRaphson2(g,1e-3,0);
    end

    x = x-t_opt*Df(x)';
    norm = sqrt(Df(x)'*Df(x));
end

x_opt = x;
min = f(x_opt);

end