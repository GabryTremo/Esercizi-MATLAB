function value_vec = rk_solve(x0, v0, f, t_i, t_f, h)
% value_vec = rk_solve(x0, v0, m, k, b, r, t_i, t_f, h) returns the
% position and velocity vectors (value_vec(1,:) and value_vec(2,:))
% resulting from the numerical solution of the equation y' = f(t,y), where
% y = [x; v] has initial condition [x0; v0] at time t_i. 
% The solution is computed until time t_f, using a Runge-Kutta 
% fourth-order method (rk4) with step h

t_vec = t_i : h : t_f;

n = length(t_vec);

value_vec = zeros(2,n);
value_vec(:,1) = [x0; v0];

for j = 1:n-1
    value_vec(:,j+1) = rk_step(value_vec(:,j), t_vec(j),h,f);
end






