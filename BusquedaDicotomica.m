function [k,centro,min]=BusquedaDicotomica(f,h,a,b)
% Se busca el mínimo de una función unimodal empleando la búsqueda
% dicotómica. 'f' debe ser una función anónima, 'h' es la tolerancia 
% y [a,b] es el intervalo donde la función es unimodal. La función
% devuelve el número de iteraciones 'k', el valor del óptimo, 'centro', y 
% el mínimo valor de la función, 'min'.

% Tiempo de inicio
tic
    
% Distancia al centro del intervalo. Debe cumplirse 2*eps<h
eps = h/10; 

k = 0;

% Representación gráfica
x = linspace(a,b,1000);
y = f(x);
figure
plot(x,y,'b','LineWidth',3)
xlabel('\bf{x}','Interpreter','latex')
ylabel('\bf{f(x)}','Interpreter','latex')
title('Búsqueda Dicotómica','FontSize',18,'FontWeight','bold')
grid on
hold on

centro = (a+b)/2;

% Implementación del método (Se introduce un máximo número de iteraciones)
while b-a > h && k < 100

    centro = (a+b)/2;
    x1 = centro - eps;
    x2 = centro + eps;

    if f(x1) >= f(x2)
        a = x1;
    elseif f(x1) < f(x2)
        b = x2;
    end

    k = k + 1;

    % Representación del intervalo
    plot([a,b],[f(a),f(b)],'ro-','MarkerSize',10,'LineWidth',1.5)

end

min = f(centro);

% Leyenda
legend('f(x)','Intervalo')

% Representación del mínimo
plot(centro,f(centro),'go','MarkerSize',10,'MarkerFaceColor','g', ...
    'DisplayName','Solución óptima')

% Tiempo de finalización
toc

end