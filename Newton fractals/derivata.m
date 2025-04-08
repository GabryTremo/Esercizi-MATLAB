function dp = derivata(p)
% dp = derivata(p) calcola il vettore dei coefficienti della derivata di p,
% polinomio passato come vettore dei coefficienti
sz = length(p);
n = sz - 1;
dp = zeros(1,n);
for i = 1:n
    dp(i) = (n-i+1)*p(i);
end
end