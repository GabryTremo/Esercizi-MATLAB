% The script plots the position and velocity vectors
% resulting from the numerical solution of the equation y' = f(t,y), where
% y = [x; v] has initial condition [x0; v0] at time t_i. 
% The solution is computed until time t_f, using a Runge-Kutta 
% fourth-order method (rk4) with step h.
% f is the 2-d vector field obtained from the equations of a damped
% oscillator, with mass m, elasticity coefficient k, friction coefficient
% b, and with a sinusoidal external force multiplied by a strength
% coefficient r. 
% All the parameters are set at the start, but a slider is created in the
% figure, to let the user change the value of the friction coefficient b
% and see how the solution changes in real time.

x0 = 1;
v0 = -3;
m = 1;
k = 1;
b = 0.5;
r = 0.1;
t_i = 0;
t_f = 30;
n = 100;
h = (t_f - t_i)/n;

F = @(t) r*sin(t);
f = @(t,z) [z(2); (1/m)*(F(t)-b*z(2)-k*z(1))];

% Solves the equations using the functions 
t_vec = t_i : h : t_f;
value_vec = rk_solve(x0,v0,f,t_i,t_f,h);

% Plots the position and velocity
subplot(1,2,1);
pl1 = plot(t_vec,value_vec(1,:));
axis([t_i, t_f, -2*abs(x0), 2*abs(x0)]);
title("x(t)");

subplot(1,2,2);
pl2 = plot(t_vec,value_vec(2,:));
axis([t_i, t_f, -2*abs(v0), 2*abs(v0)]);
title("v(t)");

% Creates a slider ui control for the value of b, with minimum value of 0,
% maximum value of 1 and initial value of 0.5 (the same as the initial
% plot)
slider = uicontrol('Style', 'slider', ...  
           'Min', 0, 'Max', 1, 'Value', 0.5, ...  
           'Position', [20 20 100 20], ...  
           'Callback', @(src,~) set_b(x0,v0,m,k,r,src,t_i,t_f,h, pl1, pl2));  
% src is the source object, in this case the slider. The anonymous function
% calls the callback function. Normally this should not be necessary, but
% the reason here is that I want to pass other arguments to the function
% other than (src, event)

% Writes the plain text "friction coefficient" under the slider
uicontrol('Style', 'text', 'String', 'Friction coefficient: ', 'Position', [1, 1, 100, 15], 'FontSize', 8);

% Initializes the text, that tells the value of b, at the starting value of
% b (0.5), and then assigns the object to value_display to pass it to the
% next function
value_display = uicontrol('Style', 'text', 'String', '0.5', 'Position', [96, 1, 20, 15], 'FontSize', 8);

% addlistener attaches an event listener to an object (in this case the 
% slider defined above). The event listener waits for the event
% "ContinuousValueChange" and then activates the callback function. The
% callback function then updates the value of the slider using the function
% defined below
addlistener(slider, 'ContinuousValueChange', @(src, ~) update_value(src, value_display));


%------------functions------------

% Updates the value of b and creates the two new plots accordingly
function set_b(x0,v0,m,k,r,src,t_i,t_f,h, pl1, pl2)
    b = src.Value;
    F = @(t) r*sin(t);
    f = @(t,z) [z(2); (1/m)*(F(t)-b*z(2)-k*z(1))];
    value_vec = rk_solve(x0,v0,f,t_i,t_f,h);
    set(pl1, 'YData', value_vec(1,:));
    set(pl2, 'YData', value_vec(2,:));
end


% Updates the value in the text below the slider
function update_value(src, value_display)
    current_value = src.Value;  
    set(value_display, 'String', num2str(current_value));  
end
