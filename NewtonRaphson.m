function [x,k]=NewtonRaphson(f,h,x0)
% Función que implementa el método iterativo de Newton-Raphson para
% calcular el cero simple de una función continuamente diferenciable en un
% entorno de este. Toma por argumentos la función objetivo 'f' como función
% anónima, la tolerancia 'h' con la que se encuentra la solución y el punto
% inicial 'x0' por el que se comienza a buscar. La función devuelve la
% aproximación del valor donde ocurre el cero, 'x', y el número de
% iteraciones empleadas 'k'.

x = x0;
k = 1;
sol = zeros(1,100); % Se fija un tamaño para el array (buena práctica).
sol(1) = x; % Array donde se almacenan las progresivas aproximaciones.

% Se crea una variable auxiliar simbólica, 'y', para calcular la derivada
% de la función 'f'.
syms y
g(y) = f(y);
dev_f = diff(g,y); % Derivada de la función como función simbólica. Por 
                   % ello, luego se precisa convertirla a clase 'double'.

% Proceso iterativo
while abs(f(x)) > h && k < 100
    x = x - f(x)/double(dev_f(x));
    k = k + 1;
    sol(k) = x;
end

sol(k+1:end) = []; % Se eliminan entradas del array que no corresponden a 
                   % resultados de las iteraciones.

% Representación gráfica de la convergencia al punto óptimo
figure()
plot(sol,'b-o','LineWidth',3, 'MarkerFaceColor','b')
xlabel('\bf{Iteraciones}','Interpreter','latex')
ylabel('$x^*$','Interpreter','latex','FontSize',17)
title('Newton-Raphson','FontSize',18,'FontWeight','bold')
grid on

% Representación gráfica de la función f(x) y sus rectas tangentes
d = max(sol)-min(sol);
t = linspace(min(sol)-d,max(sol)+d,1000);
im = f(t);
figure()
plot(t,im,'b','LineWidth',3)
hold on

for k=1:length(sol)
    recta_tangente = f(sol(k))+double(dev_f(sol(k)))*(t-sol(k));
    plot(t,recta_tangente,'--','LineWidth',2)
end

xlabel('$x$','Interpreter','latex','FontSize',18)
ylabel('$f(x)$','Interpreter','latex','FontSize',18)
xlim([min(sol)-d,max(sol)+d])
ylim([min(im),max(im)])
grid on
cero = zeros(size(t));
plot(t,cero,'k','LineWidth',2)
legend('f(x)','Recta tangente')
hold off

end