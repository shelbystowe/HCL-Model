function P = Set_Parameters()

% SET INITIAL CONDITIONS
P.x_init = -0.9642; % Circadian drive 
P.y_init = -0.4837; % Auxilary variable 
P.n_init = 0.4128; % Proportion of activated photoreceptors 

% SET PARAMETER VALUES
% Circadian oscillator parameters
%P.alpha0  = 0.16/60; % modulates how light affects the fraction of activated photoreceptors
P.alpha0  = 0.05*60; %0.16*60; % CHANGED based on Errata
P.I0      = 9500; % scaling factor
P.p       = 0.5; %0.6; % modulates the steepness of the dose response curve to light % CHANGED based on Errata
P.G       = 33.75/60; %19.9; % modulates the strength of the effect of light % CHANGED based on Errata
P.b       = 0.4; % modulates timing of maximum light sensitivity 
P.gamma   = 0.23; % stiffness parameter
%P.kappa   = (12/pi)*60*60; % time scaling factor
P.kappa   = (12/pi);
P.f       = 0.99669; % correction factor 
P.k       = 0.55; % modulates shape of velocity response curve
%P.beta    = 0.013/60; % decay rate of photoreceptor activation
P.beta    = 0.0075*60; %0.013*60; % CHANGED based on Errata
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