function p=PolinomioLagrange(xi,yi)
% Función que devuelve el polinomio interpolador de Lagrange que pasa por
% un conjunto de puntos (x,y). Se pasan por argumentos las coordenadas 'x'
% e 'y' de los puntos como arrays, 'xi' e 'yi'.

% Ajuste de formato automático
format shortG

% Se define 't' como una variable simbólica para devolver el polinomio
% también de forma simbólica
syms x
p = 0;

for n=1:length(xi)

    % Polinomio coeficiente de Lagrange (L)
    l = xi;
    l(n) = [];
    l1 = x-l; % Para el numerador del productorio
    l2 = xi(n)-l; % Para el denominador de productorio
    L = 1;
    
    % Productorio
    for k=1:length(l)
        L = L*l1(k)/l2(k);
    end

    p = p + L*yi(n);
    
end

end