function [k,x_opt,min]=InterpolacionCuadratica(f,h,x)
% Se encuentra el mínimo de una función aproximándola por un polinomio de
% segundo grado. Se devuelven el número de iteraciones empleadas 'k', el
% valor del mínimo 'min', y el punto donde se realiza el mínimo, 'x_opt'.
% Se pasan como argumentos la función objetivo 'f' como función anónima, la
% tolerancia deseada 'h' y un vector 'x' con tres puntos para realizar la
% interpolación. El primer elemento y el tercer elemento de 'x' deben ser 
% el mínimo y el máximo valor, respectivamente, del intervalo de
% unimodalidad.

% Para posterior representación gráfica
t = linspace(x(1),x(3),1000);

% Imágenes
y = f(x);

% Polinomio interpolador; p(x)=a0+a1*x+a2*x^2
% 'A' es la matriz de Vandermonde (matriz del sistema de ecuaciones)
% 'a' es el vector con los coeficientes del polinomio; [a0,a1,a2]
A = [1, x(1), x(1)^2; 1, x(2), x(2)^2; 1, x(3), x(3)^2];
a = A\y';

% Contador de iteraciones
k = 0;

% Óptimo
x_opt = -a(2)/(2*a(3));

% Se fija en 100 el número máximo de iteraciones del método
while abs(x(2)-x_opt)>h && k < 100
    
    if x_opt > x(2)
        x(1) = x(2);
        x(2) = x_opt;
    else
        x(3) = x(2);
        x(2) = x_opt;
    end

    % Imágenes
    y = f(x);

    % Polinomio interpolador
    A = [1, x(1), x(1)^2; 1, x(2), x(2)^2; 1, x(3), x(3)^2];
    a = A\y';

    % Óptimo
    x_opt = -a(2)/(2*a(3));

    % Contador de iteraciones
    k = k + 1;

end

min = f(x_opt);

% Representación gráfica
figure()
plot(t,f(t),'b','LineWidth',3)
hold on
p = @(x)a(1)+a(2)*x+a(3)*x.^2; % Polinomio interpolador último
plot(t,p(t),'r--','LineWidth',3)
plot(x_opt,min,'go','MarkerFaceColor','g')
grid on
title('Interpolación cuadrática','FontSize',18,'FontWeight','bold')
xlabel('\bf{x}','Interpreter','latex')
ylabel('\bf{f(x)}','Interpreter','latex')
legend('f(x)','p(x)','Solución óptima')

end