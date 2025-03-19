function [k,centro]=Biseccion(f,h,a,b)
% Se busca el cero de una función empleando el método de la bisección. Se
% pasan como argumentos la función anónima 'f', la tolerancia 'h' y los
% extremos del intervalo inicial 'a' y 'b'. Se devuelven el número de
% iteraciones 'k' y la raíz de la función, 'centro'.

centro = (a+b)/2;
error1 = f(centro);
error2 = b-a;
k = 0;

% Implementación del método (Se introduce un máximo número de iteraciones)
while (error1 > h || error2 > h) && k < 100

    if f(a)*f(centro) < 0
        b = centro;
        centro = (a+b)/2;
    elseif f(centro)*f(b) < 0
        a = centro;
        centro = (a+b)/2;
    end

    k = k + 1;
    error1 = f(centro);
    error2 = b-a;

end

end