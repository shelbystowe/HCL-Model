function P = Set_Parameters()

% SET PARAMETER VALUES
% Coupling Strength Parameters
P.gsw = 1.7;
P.gws = 1.68;
P.groffron = 1.8;
P.gronroff = 4.5;
P.gdmhw = 0.08;
P.gdmhs = 0.2;
P.gorxw = 0.06; % new parameter
P.gdmhorx = 0.75; % new parameter
P.gsorx = 1; % new parameter

% Time Constants for firing rates (hours)
P.t_w = 0.1;
P.t_s = 0.1;
P.t_ron = 0.004;
P.t_roff = 0.004;
P.t_scn = 0.05;
P.t_orx = 0.1; % new parameter

% Maximum firing rate values (Hz)
P.wmax = 6;
P.smax = 6;
P.ronmax = 5;
P.roffmax = 5;
P.scnmax = 7;
P.orxmax = 6; % new parameter

% Slope of sigmoidal curve for firing rate functions
P.alpha_w = 0.5;
P.alpha_s = 0.175;
P.alpha_ron = 0.4;
P.alpha_roff = 0.5;
P.alpha_scn = 0.7;
P.alpha_orx = 0.3; % new parameter

% Half activation threshold for firing rate functions
P.b_inf_w = -0.37;
P.b_inf_ron = -0.35;
P.b_scn = 0;
P.b_inf_orx = 0.4; % new parameter

% Time contants for neurotransmitters (seconds)
P.t_cw = 0.1;
P.t_cs = 0.1;
P.t_cron = 0.05;
P.t_croff = 0.05;
P.t_cdmh = 0.1;
P.t_corx = 0.1; % new parameter

% Slope of the saturating curve for neurotransmitter release functions
P.gamma_w = 5;
P.gamma_s = 4;
P.gamma_ron = 4;
P.gamma_roff = 5;
P.gamma_DMH = 5; % new parameter
P.gamma_Orx = 5; % new parameter

% Homeostatic Process (From Rusterholz 2010)
P.hmax = 323.88;
P.hmin = 0;
P.t_hup = 15.78;
P.t_hdown = 3.37;

% Linear transformation constants (sleep)
P.ks1 = -0.1;
P.ks2 = -0.005;

% Short Term Process (STP)
P.stp_r = 0;
P.stp_max = 1.2;
P.stp_min = -0.8;
P.t_stpw = 0.5;
P.t_stpup = 1.25;
P.t_stpdown = 1.5;

% Linear transformation constants (REMoff)
P.kroff1 = 0.8;
P.kroff2 = 7;

% Thresholds for transitioning
P.theta_w = 4;
P.theta_ron = 1.5;

% Options for ODE45
P.options = odeset; % P.options = odeset( 'MaxStep', 0.9/3600);

end