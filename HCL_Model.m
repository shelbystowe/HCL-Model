function dzdt = HCL_Model(t, P)







dzdt(1) = (1/p.X)*(-H +(1 - S)*P.mu); % dHdt, homeostatic drive 
dzdt(1) = (1/P.kappa)*(P.gamma*(x - (4/3)*x^3) - y*((24/(f*t_c))^2 +P.k*B)); % dxdt, circadian drive 
dzdt(1) = (1/P.kappa)*(x+B); % dydt, auxillary variable 
dzdt(1) = P.alpha0*((I_tilde/P.I0)^P.p)*(1-n) - P.beta*n; % dndt, proportion of active photoreceptors

end 