% Simulating the Circadian Oscillator part of the HCL Model 
% as published in Skeldon et al., PLoS Comp Bio (2023)

% Shelby Stowe
% sstowe@mines.edu

% This is the main code file to run the model 
% It requires the following functions: 
    % Set_Parameters.m
    % HCL_Model.m

%% Set Up 

clear
close all
clc

% Set simulation duration
n = 2; % days
%t = [0 24*n*3600]; % seconds
t = [0 24*n]; % hours

% Set parameter values 
P = Set_Parameters; 


%% Call the HCL Model function to run the model

initial_conditions =  [P.x_init; P.y_init; P.n_init];

myODEfunction = @(t,Z)HCL_Model(t,Z,P);
sol = ode15s(myODEfunction, t, initial_conditions);

dt = 1/120;
tStart = sol.x(1);
tFinal = sol.x(end);
time = linspace(tStart,tFinal,round((tFinal-tStart)/dt));
state = deval(sol,time);

% [tout, zout] = ode15s(@(tout, zout)HCL_Model(tout,zout,P),t,initial_conditions);
% state = zout';
% time = tout';

%% Assign state variable names to solution ouptuts

x = state(1,:);
y = state(2,:);
n = state(3,:);

%% Calculate the Circadian wake propensity rhythm
C = P.c_20 + P.alpha_21.*x + P.alpha_22.*y + P.beta_21.*x.^2 + P.beta_22.*x.*y + P.beta_23.*y.^2; 

%% Plot Model Output

% Auxillary Variable
figure()
plot(time, x, 'LineWidth',2); 
% xline(23*60*60)
% xline(7*60*60)
% xline(7*60*60 + 86400)
% xline(23*60*60 + 86400)
xline(7)
xline(23)
title('Auxillary Variable (x)');
xlabel('Time (hrs)');
ax=gca;
ax.FontSize = 15;


% Circadian Variable
figure()
plot(time, y, 'LineWidth',2);  
% xline(23*60*60)
% xline(7*60*60)
% xline(7*60*60 + 86400)
% xline(23*60*60 + 86400)
xline(7)
xline(23)
title('Circadian Variable (y)');
xlabel('Time (hrs)');
ax=gca;
ax.FontSize = 15;


% xy-phase plane
figure()
plot(x, y, 'LineWidth',2);  
title('Circadian Drive xy-plane');
xlabel('x');
ylabel('y');
ax=gca;
ax.FontSize = 15;

% Proportion of Active Photoreceptors
figure()
plot(time, n, 'LineWidth',2); 
% xline(23*60*60)
% xline(7*60*60)
% xline(7*60*60 + 86400)
% xline(23*60*60 + 86400)
xline(7)
xline(23)
title('Proportion of Active Photoreceptors (n)');
xlabel('Time (hrs)');
ax=gca;
ax.FontSize = 15;


% Circadian wake propensity rhythm
figure()
plot(time, C, 'LineWidth',2); 
%xline(7*60*60)
%xline(23*60*60)
%xline(7*60*60 + 86400)
%xline(23*60*60 + 86400)
xline(7)
xline(23)
title('Circadian wake propensity rhythm (C)');
xlabel('Time (hrs)');
ax=gca;
ax.FontSize = 15;

%% For Fun Plots!

% yC-phase plane
figure()
plot(C, y, 'LineWidth',2);  
title('Circadian Drive Cy-plane');
xlabel('C');
ylabel('y');
grid on;
ax=gca;
ax.FontSize = 15;

figure()
plot3(x,y,n)
title('Circadian Drive Phase Space');
xlabel('x');
ylabel('y');
zlabel('n');
grid on;
ax=gca;
ax.FontSize = 15;

figure()
plot3(x,y,C)
title('Circadian x-y-C');
xlabel('x');
ylabel('y');
zlabel('C');
grid on;
ax=gca;
ax.FontSize = 15;

figure()
plot3(x,n,C)
title('Circadian x-n-C');
xlabel('x');
ylabel('n');
zlabel('C');
grid on;
ax=gca;
ax.FontSize = 15;
