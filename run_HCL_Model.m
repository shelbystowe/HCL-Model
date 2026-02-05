% Simulating the HCL Model 
% as published in Skeldon et al., PLoS Comp Bio (2023)

% Shelby Stowe
% sstowe@mines.edu

% This is the main code file to run the model 
% It calls the following functions: 

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

