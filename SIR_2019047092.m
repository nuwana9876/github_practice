% Condition
beta = 1;
gamma = 0.1;
tspan = [0 60];


% S(t=0)/I(t=0)/R(t=0) value initialize
y0 = [0.99 0.01 0];


% ODE45 Calculate (solve ODE)
[t,y] = ode45(@(t,y) odefcn(t,y,beta,gamma),tspan,y0);
plot(t,y,'-o')
title('ODE45 SIR Model')
legend({'S','I','R'},'Location','best')


% SI Model
% y = [S I]
%function dydt = odefcn(t,y,beta)
%    % dSdt = dydt(1) / dIdt = dydt(2)
%    dydt = zeros(2,1);
%    dydt(2) = beta*y(1)*y(2);
%    dydt(1) = -dydt(2);
%end


% SIR Model
% y = [S I R]
function dydt = odefcn(t,y,beta,gamma)
    % dSdt = dydt(1) / dIdt = dydt(2) / dRdt = dydt(3)
    dydt = zeros(3,1);
    dydt(3) = gamma*y(2);
    dydt(2) = beta*y(1)*y(2) - dydt(3);
    dydt(1) = -dydt(2)-dydt(3);
end


