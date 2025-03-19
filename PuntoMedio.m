function I=PuntoMedio(f,a,b,n)
% Función que aproxima el valor de una integral simple definida mediante el
% método de Simpson compuesto. Se pasan por argumentos la función que
% se integra, 'f', como función anónima, los límites de integración 'a' y
% 'b', y el número de nodos de integración 'n'. 'n' debe ser par; 0,2,4...

h = (b-a)/(n+2);
nodos = a+h:2*h:b-h;
I = 2*h*sum(f(nodos));

end