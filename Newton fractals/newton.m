function x=newton(p,x0)
% x = newton(p,x0) esegue il metodo di Newton sul polinomio p, passato come
% vettore dei suoi coefficienti, a partire dalla condizione iniziale x0.
% Per le valutazioni è usato il metodo di Horner.
x=x0;
px=horner(p,x0);
while(abs(px)>1E-12)
x = x - horner(p,x)/horner(derivata(p),x);
px = horner(p,x);
end
end