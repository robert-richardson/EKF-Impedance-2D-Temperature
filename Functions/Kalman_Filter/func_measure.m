function [ f ] = func_measure( f, i, meas_vec, sel_meas )
%FUNC_MEASURE Measurement update for linear measurement function.
% sel_meas corresponds to the selected measurement (core temperature vs.
% surface left/middle/right)

f.P = f.A_d*f.P*f.A_d' + f.Q;           	 % prediction update covariance
K = (f.C(sel_meas,:)*f.P*f.C(sel_meas,:)'+f.R)...             % Kalman gain
    \(f.P*f.C(sel_meas,:)');                                  
f.x(i+1,:) = f.x(i+1,:)' ...                     % Measurement update state
    + K*(meas_vec(sel_meas) - f.y(i,sel_meas)');
f.P = f.P - K*f.C(sel_meas,:)*f.P;          % Measurement update covariance

end
