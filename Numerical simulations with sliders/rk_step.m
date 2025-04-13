function y_new = rk_step(y, t, h, f)
% y_new = rk_step(y, t, h, f) returns the next step in the numerical
% solution of the differential equation y' = f(t,y), starting from y at
% time t, and according to the Runge-Kutta fourth-order method (rk4)

k1 = f(t,y);
k2 = f(t+h/2, y + h*k1/2);
k3 = f(t+h/2, y+ h*k2/2);
k4 = f(t+h, y+k3);

y_new = y + (h/6)*(k1+k2+k3+k4);