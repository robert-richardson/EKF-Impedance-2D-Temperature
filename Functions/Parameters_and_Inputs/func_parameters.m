function [p] = func_parameters()
% func_parameters Define model parameters
% Assigns the known parameters used in the SG models and stores them in
% struct 'p'. These parameters were already known from previous literature.
% Parameters identified through additional experiments (i.e. kz, hr, hl, ht
% and hb) are assigned later.

p.r1 = 0.004/2;                	% inner radius [m]
p.r2 = 0.032/2;                	% outer radius [m]
p.z1 = 0;                      	% bottom coordinate [m]
p.z2 = 0.113;                  	% top coordinate [m]
p.Vb = pi*(p.r2^2-p.r1^2)*p.z2;	% volume [m^2]
p.rho = 2680;                  	% density [kg m^-3]
p.kr = .35;                  	% radial thermal conductivity [W m^-1 K^-1]
p.cp = 910;                   	% specific heat capacity [J kg^-1 K^-1]

end
    
    
    
    
    
    
    
    
