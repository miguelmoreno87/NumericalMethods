function [k,x_opt,min]=Fibonacci(f,h,a,b)
% Función que halla el mínimo de una función empleando la búsqueda de
% Fibonacci. Se devuelven el número de iteraciones 'k', el punto donde se
% realiza el mínimo, 'x_opt', y dicho mínimo, 'min'. Se deben dar como
% argumentos la función objetivo 'f' como función anónima, la tolerancia
% 'h' y el intervalo inicial de unimodalidad [a,b].

k = 1;

% Representación gráfica
x = linspace(a,b,1000);
y = f(x);
figure()
plot(x,y,'b','LineWidth',3)
xlabel('\bf{x}','Interpreter','latex')
ylabel('\bf{f(x)}','Interpreter','latex')
title('Búsqueda de Fibonacci','FontSize',18,'FontWeight','bold')
grid on
hold on

% Cálculo del número de la sucesión de Fibonacci
F1 = 1;
F2 = 2;
F = F1 + F2;
n = 3; % Índice que identifica al número en la sucesión 

while F < (b-a)/h
    F1 = F2;
    F2 = F;
    F = F1 + F2;
    n = n + 1;
end

% Wn es la longitud de cada segmento en los que se divide el intervalo
% original [a,b]
Wn = (b-a)/F;

% Paso inicial
xa = b - F2*Wn;
xb = a + F2*Wn;
fa = f(xa);
fb = f(xb);

% Representación del intervalo
plot([a,b],[f(a),f(b)],'ro-','MarkerSize',10,'LineWidth',1.5)

% Se va hacia atrás en la sucesión de Fibonacci
F = F2;
F2 = F1;

% Búsqueda
while k < n-2

    if fa >= fb
        a = xa;
        xa = xb;
        xb = a + F2*Wn;
        fa = fb;
        fb = f(xb);

        F1 = F - F2;
        F = F2;
        F2 = F1;
    else
        b = xb;
        xb = xa;
        xa = b - F2*Wn;
        fb = fa;
        fa = f(xa);

        F1 = F - F2;
        F = F2;
        F2 = F1;
    end
    
    % Representación del intervalo
    plot([a,b],[f(a),f(b)],'ro-','MarkerSize',10,'LineWidth',1.5)
    k = k + 1;
end

% Para seleccionar el punto óptimo se realiza un último paso de búsqueda
% dicotómica
xa = b - F2*Wn;

if f(xa+h/2)<f(xa)
    x_opt = xa+h/2;
else
    x_opt = xa-h/2;
end

min = f(x_opt);

% Leyenda
legend('f(x)','Intervalo')

% Representación del mínimo
plot(x_opt,min,'go','MarkerSize',10,'MarkerFaceColor','g', ...
    'DisplayName','Solución óptima')
hold off

end