% Simulating the HCL Model 
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
n = 1; % days
t = [0 24*n]; % hours

% Set parameter values 
P = Set_Parameters; 


%% Call the HCL Model function to run the model

initial_conditions =  [P.H_init; P.x_init; P.y_init; P.n_init];

myODEfunction = @(t,Z)HCL_Model(t,Z,P);
sol = ode45(myODEfunction, t, initial_conditions, P.options);

dt = 1/120;
tStart = sol.x(1);
tFinal = sol.x(end);
time = linspace(tStart,tFinal,round((tFinal-tStart)/dt));
state = deval(sol,time);

%% Assign state variable names to solution ouptuts

H = state(1,:);
x = state(2,:);
y = state(3,:);
n = state(4,:);

%% Calculate the Circadian wake propensity rhythm
C = P.c_20 + P.alpha_21.*x + P.alpha_22.*y + P.beta_21.*x.^2 + P.beta_22.*x.*y + P.beta_23.*y.^2; 

%% Plot Model Output

% Homeostatic Sleep Drive
figure()
plot(time, H, 'LineWidth',2);  
title('Homeostatic Sleep Drive (H)');
xlabel('Time (hours)');
ylabel('% SWA')
ax=gca;
ax.FontSize = 15;


% Circadian Drive
figure()
plot(time, x, 'LineWidth',2);  
title('Circadian Drive (x)');
xlabel('Time (hours)');
ax=gca;
ax.FontSize = 15;


% Auxillary Variable
figure()
plot(time, y, 'LineWidth',2);  
title('Circadian Drive Auxillary Variable (y)');
xlabel('Time (hours)');
ax=gca;
ax.FontSize = 15;


% Proportion of Active Photoreceptors
figure()
plot(time, n, 'LineWidth',2);  
title('Proportion of Active Photoreceptors (n)');
xlabel('Time (hours)');
ax=gca;
ax.FontSize = 15;


% Circadian wake propensity rhythm
figure()
plot(time, C, 'LineWidth',2);  
title('Circadian wake propensity rhythm (C)');
xlabel('Time (hours)');
ax=gca;
ax.FontSize = 15;
