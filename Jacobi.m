function [x,iter,error_rel] = Jacobi(A,b,x0,tol,maxiter)
% Método iterativo de Jacobi para resolver un sistema de ecuaciones
% lineales Ax=b. Se deben pasar la matriz del sistema 'A', el vector de
% términos independientes 'b', la aproximación inicial 'x0', la tolerancia
% 'tol' y el número máximo de iteraciones 'maxiter'. Se devuelve la
% aproximación final 'x' para la solución, el número de iteraciones 'iter'
% y el error relativo 'error_rel'.

iter = 0;

L = tril(A,-1); % Matriz triangular inferior sin la diagonal principal
U = triu(A,1); % Matriz triangular superior sin la diagonal principal
d = diag(A); % Vector diagonal principal
invD = diag(1./d); % Inversa de la matriz diagonal principal
N = -(L+U);

error_rel = tol+1; % Inicialización arbitraria del error relativo

while iter < maxiter && error_rel > tol
    x = invD*N*x0+invD*b;
    error_rel = norm(x-x0)/norm(x0);
    iter = iter + 1;
    x0 = x;
end