function val = decide(p,x)
% val = decide(p,x) restituisce l'indice da 1 a n della radice di p,
% polinomio passato come vettore dei coefficienti, che sia più vicina ad x
v = roots(p);
w = abs(x-v);
[~ , val] = min(w);
