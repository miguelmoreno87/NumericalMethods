function I=Trapecios(f,a,b,n)
% Función que aproxima el valor de una integral simple definida mediante el
% método de los trapecios compuesto. Se pasan por argumentos la función que
% se integra, 'f', como función anónima, los límites de integración 'a' y
% 'b', y el número de intervalos entre nodos de integración 'n'.

h = (b-a)/n; % Paso
pesos = [1, 2*ones(1,n-1), 1];
nodos = a:h:b;
I = (h/2)*sum(pesos.*f(nodos));

end