function [ model ] = func_hist_errors( model, exp, xmax )
%FUNC_NUM_ERRORS Finds number of errors for histogram plots
%   Inputs: (model, experimental, maxtime)
%   Output: model with error values assigned

model.eTr1 = model.Tr1(1:xmax) - exp.Tr1(1:xmax)';
model.eTr2 = model.Tr2(1:xmax) - exp.Tr2(1:xmax)';
model.rmsr1 = sqrt(sum(model.eTr1.^2)/xmax);
model.rmsr2 = sqrt(sum(model.eTr2.^2)/xmax);

end

