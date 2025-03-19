function I=Simpson(f,a,b,n)
% Función que aproxima el valor de una integral simple definida mediante el
% método de Simpson compuesto. Se pasan por argumentos la función que
% se integra, 'f', como función anónima, los límites de integración 'a' y
% 'b', y el número de intervalos entre nodos de integración 'n'.

h = (b-a)/n;
indices_pares = 2:2:n; 
pesos = [1, 2*ones(1,n-1), 1];
pesos(indices_pares) = 4;
nodos = a:h:b;
I = (h/3)*sum(pesos.*f(nodos));

end