function [ s ] = func_rename_outputs( s )
%FUNC_ASSIGN_OUTPUTS Assign measurement location outputs from model
%outputs (y1 - y7)
%   Measurement location provides a more intuitive naming system for the
%   outputs.

% First, remove last output in each case
for i = 1:7; s.y(end,i) = s.y(end-1,i); end

% Now assign to intuitive names
s.Tz1 = s.y(:,1);
s.Tz2 = s.y(:,2);
s.Tr1 = s.y(:,3);
s.Tr2 = s.y(:,4);
s.Tr2z2 = s.y(:,5);
s.Tr2z1 = s.y(:,6);
s.Tm = s.y(:,7);

end

