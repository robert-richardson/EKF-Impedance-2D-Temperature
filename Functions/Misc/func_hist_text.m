function [ output_args ] = func_hist_text(xloc,yloc,str1,interpreter1)
%FUNC_HIST_TEXT Summary of this function goes here
%   Detailed explanation goes here
if nargin<4; interpreter1 = 'latex'; end

text(xloc,yloc,str1,'fontsize',10,'interpreter',interpreter1,'Units','normalized')

end

