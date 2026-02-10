function dzdt = HCL_Model(t, Z, P)

% Function to run the HCL Model 
    % t is the passed in simulation time 
    % Z is the passed in state variable values from the previous time step
    % P is the passed in parameter values structure


%% State Variables

H = Z(1);
x = Z(2);
y = Z(3);
n = Z(4);

S = P.S_init; % S = 1 during sleep, S = 0 during wake

%% Supporting Equations

% Circadian wake propensity rhythm
C = P.c_20 + P.alpha_21*x + P.alpha_22*y + P.beta_21*x^2 + P.beta_22*x*y + P.beta_23*y^2; 

% Homeostatic Drive 
if S == 0 % if awake, stop at upper threshold
    H_threshold   = P.H0p + C;
    value(1)      = H-H_threshold;
else % if asleep, stop at lower threshold
    H_threshold   = P.H0m + C;  %if asleep, stop at lower threshold
    value(2)      = H-H_threshold;
end

% Circadian Oscillator 
% Build the light schedule
for i=1:length(t)
    if mod(t,24)>=23 || mod(t,24)<=7
        I=P.daylight;
    else
        I=P.eveninglight;
    end
end

I_tilde = (1-S)*I;
B_hat = P.G*P.alpha0*((I_tilde/P.I0)^P.p)*(1-n);
B = (1-(P.b*x))*(1-(P.b*y))*B_hat;


%% Differential Equations 

dzdt = zeros(size(Z));

dzdt(1) = (1/P.X)*(-H +(1 - S)*P.mu); % dHdt, homeostatic drive 
dzdt(2) = (1/P.kappa)*(P.gamma*(x - (4/3)*x^3) - y*((24/(P.f*P.tau_c))^2 +P.k*B)); % dxdt, circadian drive 
dzdt(3) = (1/P.kappa)*(x+B); % dydt, auxillary variable 
dzdt(4) = P.alpha0*((I_tilde/P.I0)^P.p)*(1-n) - P.beta*n; % dndt, proportion of active photoreceptors

% Check if we have switched to wake/switched to sleep


end 