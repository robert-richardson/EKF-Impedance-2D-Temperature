function [ f ] = func_predict( f, i, ui )
%FUNC_PREDICTION_UPDATE Prediction step for Kalman filters or open loop
% model.

f.u(:,i) = ui;                                          % inputs
f.x(i+1,:) = f.A_d*f.x(i,:)' + f.B_d*f.u(:,i);          % prediction update state
f.y(i,:) = f.C*f.x(i,:)' + f.ye';                       % predicted outputs

end

