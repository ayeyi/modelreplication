% Plotting Real data vs. Exponential vs. Logistic

% first graph - exponential

a=2.88/100; %growth rate
No=12313469; % inital condition when year =1967
f=@(t,y)a*No*exp(a*t);
yo=No;
[t,y]=ode45(f,[-1 44],yo);
start_year = 1967;
x_shifted = t + (start_year - min(t));

%logistic model

%diff(K/(1+ ((K-No)/(No))* exp(-a*t)))=f where K = carrying capacity
g= @(t,y3)(4538975662747406386924569*exp(-(18*t)/625))/(219902325555200*((8470855939918191*exp(-(18*t)/625))/35184372088832 + 1)^2);
yo=No;

[t,y3]=ode45(g,[-1 44],yo);
start_year = 1967;
x_shifted2 = t + (start_year - min(t));

% real values
t2=[1967 1978 1988 2002 2012];
y2 =[12313469,17512610, 23174335, 34443603, 44928923];

%plotting everything together
figure;
plot( t2, y2, x_shifted,y,"k-.",x_shifted2, y3,"r", "LineWidth", 2);
xlabel("Years")
ylabel("Population")
legend("Census", "Exponential","Logistic")
title(" Tz:Comparison of Models and Five Censuses Data")
xlim([1960 2020])
grid on;



