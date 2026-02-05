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

% Set initial conditions
H_init = 1; % Homeostatic drive
x_init = 1; % Circadian drive 
y_init = 1; % Auxilary variable 
n_init = 1; % Proportion of activated photoreceptors 

% Set parameter values 
P = Set_Parameters; 




%% Testing the gitignore 