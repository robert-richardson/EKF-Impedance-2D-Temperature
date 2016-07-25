function [ f ] = func_init_kf( f, Qin, Rin, Pin, n )
%FUNC_INIT_KF Initialise Kalman filter
% Input:    (model,Q,R,P)
% Output:   model with Q, R and P assigned. 
% default measurement size = 1
if nargin < 5; n = 1; end
f.Q = Qin^2*eye(n);                  % beta = 0.0005  (Kim, 2013)
f.R = Rin^2*eye(n);                  % beta_v = 0.05  (Kim, 2013)
f.P = Pin*eye(n);

end

