function [k,x_opt,min]=RectasInexactas(f,h,x)
% Se determina el punto óptimo 'x_opt' y el mínimo 'min' de una función
% unimodal usando el método de las rectas inexactas. Por argumentos se
% pasan la función objetivo 'f' como una función anónima, la tolerancia
% 'h' y el punto inicial 'x'.

alpha = 1e-4;
beta = 0.1;
k = 0; % Contador de iteraciones

% Se crea una variable auxiliar simbólica, 'y', para calcular la derivada
% de la función 'f'
syms y
fy = f(y);
dev_f = diff(fy,y);

while abs(double(subs(dev_f,x))) > h && k < 100

    % Dirección de descenso
    if double(subs(dev_f,x)) < 0
        d = 1;
    else
        d = -1;
    end

    lambda = 10;
    while f(x+lambda*d) > f(x)+alpha*lambda*double(subs(dev_f,x))*d || ...
        beta*double(subs(dev_f,x))*d > double(subs(dev_f,x+lambda*d))*d

        lambda = 0.5*lambda;
    end

    x = x + lambda*d;
    k = k + 1;

end

x_opt = x;
min = f(x_opt);
end