function dzdt = HCL_Model(t, Z, P)

% Function to run the HCL Model 
    % t is the passed in simulation time 
    % Z is the passed in state variable values from the previous time step
    % P is the passed in parameter values structure


%% State Variables

x = Z(1); % auxillary variable 
y = Z(2); % circadian variable 
n = Z(3); % proportion of activated photoreceptors 

%% Supporting Equations

% Build the light schedule
for i=1:length(t)
    %if mod(t,24*60*60)>=23*60*60 || mod(t,24*60*60)<=7*60*60
    if mod(t,24)>=23 || mod(t,24)<=7
        I=P.day;
        S = 0;
    else
        I=P.night;
        S = 1;
    end
end

I_tilde = (1-S)*I;
B_hat   = P.G*P.alpha0*((I_tilde/P.I0)^P.p)*(1-n);
B       = (1-(P.b*x))*(1-(P.b*y))*B_hat;

%% Differential Equations 

dzdt = zeros(size(Z));

dzdt(1) = (1/P.kappa)*(P.gamma*(x - (4/3)*x^3) - y*((24/(P.f*P.tau_c))^2 +P.k*B)); % dxdt, auxillary variable 
dzdt(2) = (1/P.kappa)*(x+B); % dydt, circadian drive 
dzdt(3) = P.alpha0*((I_tilde/P.I0)^P.p)*(1-n) - P.beta*n; % dndt, proportion of active photoreceptors


end 