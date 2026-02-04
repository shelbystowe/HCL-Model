function P = Set_Parameters()
    
    % SET SIMULATION TIME
    Days = 1; % Set number of days to simulate
    P.tEnd = 24*Days; % Convert to hours 

    % SET INITIAL CONDITIONS
    P.W_LC_init = 4.4409;
    P.W_DR_init = 0; % new state variable
    P.W_TMN_init = 0; % new state variable
    P.S_init = 0.4258;
    P.Ron_init = 0.0302;
    P.Roff_init = 5; 
    P.SCN_init = 0.3919; 
    P.DMH_init = P.SCN_init;
    P.Orx_init = 0.3558; % new state variable
    P.cW_LC_init = 0.7177;
    P.cW_DR_init = 0; % new state variable
    P.cW_TMN_init = 0; % new state variable
    P.cS_init = 0.0926;
    P.cRon_init = 0.0075;
    P.cRoff_init = 0.7616;
    P.cDMH_init = 0.0833; % new state variable
    P.cOrx_init = 0.3893; % new state variable
    P.C_init = cos(-(12)*2*pi/24);
    P.thetaCirc_init = 191.6372;
    P.H_init = 202.1580;
    P.stp_init = 1.0796e-13;
    P.delta_init = 10;
    P.omega_init = 3.0027e-04;

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

    % SET NOISE PARAMETERS
        % Noise parameters for Xi and other terms
        % NOTE: Noise can be turned on/off in odeOxNetwork.m file
        tempscale = 10;
        P.omega_max = 0.01/tempscale; % chance per second
        P.omega_min = 0.003/tempscale;
        % computeNoiseTerms.m function computes the values of the noisy xi terms that modulate the neurotransmitter levels
        [P.xi_W_history,P.xi_S_history,P.xi_Ron_history,P.xi_Roff_history,P.delta_min_history,P.delta_max_history,P.xi_DMH_history,P.xi_orx_history] = computeNoiseTerms(P.tEnd,P.omega_min,P.omega_max); 
        
        % Delta value noise term
        P.delta_reset_value = 3; % NOTE: this value was 10 in rat model
        
        % Omega dictates the frequency of the delta stimulation
        P.t_omega = 5/3600; 
        P.t_stim = 40/3600; % NOTE: this was 10/3600 in rat model

    % Options for ODE45
    P.options = odeset; % P.options = odeset( 'MaxStep', 0.9/3600);

end