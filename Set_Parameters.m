function P = Set_Parameters()

% SET INITIAL CONDITIONS
P.x_init = 0.8206; % Circadian drive 
P.y_init = -0.6128; % Auxilary variable 
P.n_init = 0.3720; % Proportion of activated photoreceptors 

% SET PARAMETER VALUES
% Circadian oscillator parameters
P.alpha0  = 0.16/60; % modulates how light affects the fraction of activated photoreceptors
P.I0      = 9500; % scaling factor
P.p       = 0.6; % modulates the steepness of the dose response curve to light
P.G       = 19.9; % modulates the strength of the effect of light
P.b       = 0.4; % modulates timing of maximum light sensitivity 
P.gamma   = 0.23; % stiffness parameter
P.kappa   = (12/pi)*60*60; % time scaling factor
P.f       = 0.99669; % correction factor 
P.k       = 0.55; % modulates shape of velocity response curve
P.beta    = 0.013/60; % decay rate of photoreceptor activation
P.tau_c   = 24.2; % Circadian period

% Circadian wake propensity rhythm parameters 
P.c_20        = 0.7896;
P.alpha_21    = -0.3912;
P.alpha_22    = 0.7583;
P.beta_21     = -0.4442;
P.beta_22     = 0.0250;
P.beta_23     = -0.9647;

% Light parameters for synthetic light profile
P.day   = 700;
P.night = 0;


end