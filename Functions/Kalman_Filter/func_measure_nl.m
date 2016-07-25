function [ f ] = func_measure_nl( f, i, Zm, p )
%FUNC_MEASURE Measurment update for non-linear measurement function.
%   EKF using Imaginary Impedance measurement input

f.P = f.A_d*f.P*f.A_d' + f.Q;             	 % prediction update covariance
H_x = func_Jacobian(f,p,i);
K = (H_x*f.P*H_x'+f.R)\(f.P*H_x');                            % Kalman gain
f.Zp(i) = func_nl(f,i,p)';
f.x(i+1,:) = f.x(i+1,:)' + K*(Zm - f.Zp(i));     % Measurement update state
f.P = f.P - K*H_x*f.P;                      % Measurement update covariance

end

% Measurement fucntion (impedance)
function Zp = func_nl(f,i,p)
Tm = f.y(i,7);
switch length(p)
    case 2; Zp = p(1)*Tm + p(2);
    case 3; Zp = p(1)*Tm^2 + p(2)*Tm + p(3);
end
end

% Jacboian matrix
function H_x = func_Jacobian(f,p,i)
H_x = zeros(1,length(f.A));
for j = 1:length(f.A)
    switch length(p)
        case 2; H_x(j) = p(1)*f.C(7,j);
        case 3; H_x(j) = p(2)*f.C(7,j) + ...
                2*f.C(7,j)*p(1)*(f.C(7,:)*f.x(i,:)' + f.ye(7));
    end
end
end