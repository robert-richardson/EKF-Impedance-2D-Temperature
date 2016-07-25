function [p] = func_inputs_exp(p,exp)
%FUNC_INPUTS Defines model inputs
% Defines the inputs to the SG model and stores them in the struct 'p'.

% External temperatures at each edge
T_external = 8.3;
p.Tinfl = T_external;                          % left (air) temperature [K]
p.Tinfr = T_external;                         % right (air) temperature [K]
p.Tinfb = T_external;                      % bottom (water) temperature [K]
p.Tinft = T_external;                           % top (air) temperature [K]
p.Tinit = T_external;                      % initial (cell) temperature [K]


% Experimental
p.t = exp.t;                                                         % time
p.tfin = p.t(end);                                               % end time
p.Q = abs(exp.I.*(exp.V-3.3));                            % heat generation

end
