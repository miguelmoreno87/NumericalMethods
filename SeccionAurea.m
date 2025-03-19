function [a,b,k,min]=SeccionAurea(f,h,x1,x2)
    % Función que halla el mínimo de una función unimodal implementando
    % el método de la sección áurea. Los parámetros son la función objetivo
    % 'f' introducida como función anónima, la tolerancia 'h' del método
    % y el intervalo [x1,x2] inicial. Se devuelve el intervalo final [a,b]
    % de acuerdo con la tolerancia, el número de iteraciones 'k' y el 
    % mínimo óptimo encontrado.

    % Tiempo de incicio
    tic
    
    % Número áureo menos uno
    r = (sqrt(5)-1)/2;

    % Representación gráfica
    x = linspace(x1,x2,1000);
    y = f(x);
    plot(x,y,'b','LineWidth',3)
    xlabel('\bf{x}','Interpreter','latex')
    ylabel('\bf{f(x)}','Interpreter','latex')
    title('Búsqueda Dicotómica','FontSize',18,'FontWeight','bold')
    grid on
    hold on

    % Paso inicial del método
    a = x1;
    b = x2;
    y = a + (1-r)*(b-a);
    z = a + r*(b-a);
    k = 0;
    f1 = f(y);
    f2 = f(z);

    % Implementación del método (100 es el máximo número de iteraciones)
    while b-a > h && k < 100

        if f1>=f2
            a = y;
            y = z;
            z = a + r*(b-a);
            f1 = f2;
            f2 = f(z);
        else
            b = z;
            z = y;
            y = a + (1-r)*(b-a);
            f2 = f1;
            f1 = f(y);
        end

        k = k + 1;

        % Representación del intervalo
        plot([a,b],[f(a),f(b)],'ro-','MarkerSize',10,'LineWidth',1.5)
    end

    centro = (a+b)/2;
    min = f(centro);

    % Leyenda
    legend('f(x)','Intervalo')

    % Representación del mínimo
    plot(centro,min,'go','MarkerSize',10,'MarkerFaceColor','g', ...
        'DisplayName','Solución óptima')
    
    % Tiempo de finalización
    toc
end