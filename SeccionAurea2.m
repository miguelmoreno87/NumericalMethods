function [centro,k,min]=SeccionAurea2(f,h,x1,x2)
    % Función que halla el mínimo de una función unimodal implementando
    % el método de la sección áurea. Los parámetros son la función objetivo
    % 'f' introducida como función anónima, la tolerancia 'h' del método
    % y el intervalo [x1,x2] inicial. Se devuelve el intervalo final [a,b]
    % de acuerdo con la tolerancia, el número de iteraciones 'k' y el 
    % mínimo óptimo encontrado.

    % Número áureo menos uno
    r = (sqrt(5)-1)/2;

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

    end

    centro = (a+b)/2;
    min = f(centro);

end