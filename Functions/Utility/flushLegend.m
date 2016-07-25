function [ ] = flushLegend( hleg, varargin )
%FLUSHLEGEND Make legend flush with axis lines.
%   flushLegend(hleg, hax, string1) makes the legend border flush with the
%   lines of the selected axis.
% 
%   'hleg' is a handle to the legend to be operated on.
% 
%   The remaining arguments are optional.
% 
%   'hax' is an optional handle to the axis to be operated on. The defualt
%   is the current axis (gca).
% 
%   'string1' is an optional position string defining the desired position
%   of the legend. The string can be one of the following:
%   (i)     Standard Matlab legend notation (i.e. 'north', 'south', 'east',
%           'west', 'northeast', 'northwest' etc.) and abbreviations of 
%           these ('n','s', 'e','w','ne','nw', etc).
%   (ii)    'Closest' or 'closest' assigns the string to the corner closest
%           to the current legend position.
%   (iii)	If no string1 is supplied, the default is 'southeast'.
% 
%   Note: flushLegend can cope with reversing the order of the variables 
%   hax and string1, since it automatically detects which is a string and
%   which is a handle.

% ---------------------- Assign optional arguments ---------------------- %
for i = 1:length(varargin)
    if ischar(varargin{i}); string1 = varargin{i};
    else hax = varargin{i}; end
end
if ~exist('hax','var'); hax = gca; end                 % default axis (gca)
if ~exist('string1','var'); string1 = 'closest'; end   % default string


% --------------- Get current sizes and edge coordinates ---------------- %
% Legend 
leg.pos = get(hleg,'position');	% position
leg.w = leg.pos(3);           	% width
leg.h = leg.pos(4);             % height
leg.lc = leg.pos(1);           	% left
leg.bc = leg.pos(2);           	% bottom
leg.mw = leg.lc+0.5*leg.w;   	% mid-width
leg.mh = leg.bc+0.5*leg.h;     	% mid-height

% Axis
ax.pos = get(hax,'position');	% position
ax.w = ax.pos(3);             	% width
ax.h = ax.pos(4);              	% height
ax.lc = ax.pos(1);              % left
ax.bc = ax.pos(2);              % bottom
ax.rc = ax.lc+ax.w;             % right
ax.tc = ax.bc+ax.h;             % top
ax.mw = ax.lc+0.5*ax.w;         % mid-width
ax.mh = ax.bc+0.5*ax.h;         % mid-height

% ----------------------- Assign new coordinates ------------------------ %
% Check if string1 is 'current'
switch string1
    case {'closest','Closest'}  % set to closest corner to current location
        if leg.mh>=ax.mh; substring1 = 'n'; else substring1 = 's'; end
        if leg.mw>=ax.mw; substring2 = 'e'; else substring2 = 'w'; end
        string1 = strcat(substring1,substring2);        % re-assign string1
end

% Find co-ordinates of bottom left corner of legend
switch string1
    case {'ne','NE','northeast','northEast','NorthEast'}
        leg.bottomleft = [ax.rc-leg.w ax.tc-leg.h];
    case {'se','SE','southeast','southEast','SouthEast'}
        leg.bottomleft = [ax.rc-leg.w ax.bc];
    case {'nw','NW','northwest','northWest','NorthWest'}
        leg.bottomleft = [ax.lc ax.tc-leg.h];
    case {'sw','SW','southwest','southWest','SouthWest'}
        leg.bottomleft = [ax.lc ax.bc];
    case {'n','N','north','North'}
        leg.bottomleft = [ax.mw-leg.w/2 ax.tc-leg.h];
    case {'s','S','south','South'}
        leg.bottomleft = [ax.mw-leg.w/2 ax.bc];
    case {'e','E','east','East'}
        leg.bottomleft = [ax.rc-leg.w ax.mh-leg.h/2];
    case {'w','W','west','West'}
        leg.bottomleft = [ax.lc ax.mh-leg.h/2];
    otherwise
        error('Invalid string name in flushLegend')
end

% Set new legend position
leg.newpos = [leg.bottomleft, leg.w, leg.h];              % assign position
set(hleg,'position',leg.newpos);                             % set position

end

