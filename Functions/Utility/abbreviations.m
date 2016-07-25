function [pl] = abbreviations()
%ABBREVIATIONS Abbreviations for plotting
%   Inputs: none
%   Outputs: a struct, 'pl', containing abbreviations for commonly used
%   Matlab plotting string commands.

% --- PLOTTING --- %
% Lines
pl.lc = 'color';
pl.lw = 'linewidth';
pl.ls = 'linestyle';

% Markers
pl.ms = 'markersize';
pl.mfc = 'markerfacecolor';
pl.mec = 'markeredgecolor';
pl.mt = 'markertype';

% Legend
pl.loc = 'location';
pl.va = 'VerticalAlignment';
pl.ha = 'HorizontalAlignment';

% Tickmarks
pl.td = 'TickDir';
pl.tl = 'TickLength';
pl.xmt = 'XMinorTick';
pl.ymt = 'YMinorTick';
pl.xc = 'XColor';
pl.yc = 'YColor';


% --- FONT --- %
pl.fs = 'fontsize';
pl.fn = 'fontname';
pl.he = 'Helvetica';
pl.av = 'AvantGarde';
pl.cg = 'Century Gothic';


% --- COLORS --- %
% Main
pl.b = [     0    0.4470    0.7410];
pl.r = [0.8500    0.3250    0.0980];
pl.y = [0.9290    0.6940    0.1250];
pl.p = [0.4940    0.1840    0.5560];
pl.g = [0.4660    0.6740    0.1880];
pl.lb = [0.3010    0.7450    0.9330];
pl.dr = [0.6350    0.0780    0.1840];

% b/w/g
pl.w = [1,1,1];
pl.k = [0,0,0];
pl.g3 = [.3,.3,.3];

% Additional colors
pl.dg = [0.1 0.6 0.1];
pl.bg = [0.1 0.9 0.1];

% Good colors to cycle through
pl.col = {pl.r, pl.g, pl.b, pl.y, pl.p, pl.lb, pl.dr, pl.dg, pl.bg, pl.g3};





