function [ measurement_output_number ] = ...
    func_thermocouple2measurement( thermocouple_number )
%FUNC_THERMOCOUPLE2MEASUREMENT Convert thermocouple number to corresponding
% measurement output in func_spectral_galerkin
%   Four thermcoouples used: T_1 to T_4
%   This function assigns numbers based on the thermocouple to the correct
%   measurement output (see lines 150-156 of func_spectral_galerkin.m)
%   e.g. thermocouple 3 (middle surface) corresponds to output '4'.

switch thermocouple_number
    case 1; n = 3;                      % inner core (centre)
    case 2; n = 5;                      % outer surf (left)
    case 3; n = 4;                      % outer surf (middle)
    case 4; n = 6;                      % outer surf (right)
end
measurement_output_number = n;

end

