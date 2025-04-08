function newtonfractal(p,m)
% newtonfractal(p,m) restituisce un'immagine, con colore dei pixel che
% varia a seconda dei valori di una matrice img. La matrice img è una
% matrice m x m che ha come elemento (j,k) l'indice, da 1 a deg(p), della
% radice di p più vicina al valore a convergenza del metodo di Newton con
% polinomio p e condizione iniziale z0 = range(j)+1i*range(k), dove 
% range = linspace(-2,2,m)
range = linspace(-2,2,m);
img = zeros(m);
for s=1:m
    for t=1:m
        z0 = range(s)+1i*range(t);
        x = newton(p, z0);
        img(s,t) = decide(p,x);
    end
end
imagesc(img);
end