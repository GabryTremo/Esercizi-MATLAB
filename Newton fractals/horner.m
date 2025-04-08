function y = horner(p,x)
% y = horner(p,x) calcola la valutazione del polinomio p, passato come
% vettore dei suoi coefficienti [x_n ... x_0], nel punto x, usando la 
% formula di Horner in modo ricorsivo.
n = length(p);
y = p(1);
if n > 2
    for i = 1:n-1
        y = y*x + p(i+1);
    end
elseif n == 2
    y = p(2) + p(1)*x;
end
end


