function P = Set_Parameters()

% SET INITIAL CONDITIONS
P.H_init = 1; % Homeostatic drive
P.x_init = 1; % Circadian drive 
P.y_init = 1; % Auxilary variable 
P.n_init = 1; % Proportion of activated photoreceptors 

P.S_init = 1; % S = 1 during sleep, S = 0 during wake


% SET PARAMETER VALUES
% Circadian oscillator parameters
P.alpha0  = 0.16; % modulates how light affects the fraction of activated photoreceptors
P.I0      = 9500; % scaling factor
P.p       = 0.6; % modulates the steepness of the dose response curve to light
P.G       = 19.9; % modulates the strength of the effect of light
P.b       = 0.4; % modulates timing of maximum light sensitivity 
P.gamma   = 0.23; % stiffness parameter
P.kappa   = (12/pi)*60*60; % time scaling factor
P.f       = 0.99669; % correction factor 
P.k       = 0.55; % modulates shape of velocity response curve
P.lambda  = 60/(60*60); % 
P.beta    = 0.013; % decay rate of photoreceptor activation
P.tau_c   = 24.2; % Circadian period

% Circadian wake propensity rhythm parameters 
P.c_20        = 0.7896;
P.alpha_21    = -0.3912;
P.alpha_22    = 0.7583;
P.beta_21     = -0.4442;
P.beta_22     = 0.0250;
P.beta_23     = -0.9647;

% Sleep-Wake parameters
P.X     = 45*60*60; % chi value during sleep, time constant for decay
P.H0p   = 13.5; % 
P.H0m   = 12.5; % 
P.a     = 2.72; % lower asymptote
P.mu    = 18.67; % upper asymptote 
P.onoff = 0;  %If onoff=0 then in sleep state.  IF onoff=1 then in wake state. This is controlling S
P.ca    = 1.72; % circadian amplitude

% Light parameters for synthetic light profile
P.daylight     = 700;
P.eveninglight = 40;
P.dawn         = 7.5*60*60;
P.dusk         = 16.5*60*60;

P.gated = 1; % 1 means that light is self-selected.

P.options = odeset; % P.options = odeset( 'MaxStep', 0.9/3600);

P.onoff = 0;  %If onoff=0 then in sleep state.  IF onoff=1 then in wake state.

end