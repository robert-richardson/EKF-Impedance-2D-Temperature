
%% Plot error histograms

%% Initialise
clear; close all; clc;
addpath(genpath('./Functions'));
addpath(genpath('./Data'));
fl = abbreviations();
set(0,'defaultaxeslinewidth',1.0)
set(0,'defaultlinelinewidth',1.4)


%% Load
mult = struct;
for sel_exp = 1:4
    switch sel_exp
        case 1; load('ErrorData4');
        case 2; load('ErrorData3');
        case 3; load('ErrorData2');
        case 4; load('ErrorData1');
    end
    mult(sel_exp).kf = kf;
    mult(sel_exp).ekf = ekf;
end


%% Plot
xloc = 0.03;
xlims = 1.5;

figure('position',[100 50 600 900])
for i = 1:4;
    % --- T_1 --- %
    subplot(4,2,2*i-1)
    h1 = histogram(mult(i).kf.eTr1);
    hold on
    h2 = histogram(mult(i).ekf.eTr1);
    xlim([-xlims xlims])
    xlabel('Error (\circC)');
    ylabel('Number of points');
    h1.BinWidth = .1; % uniform bin width
    h2.BinWidth = .1;
    
    % Text
    func_hist_text(xloc,0.92,mult(i).ekf.str_r1)
    func_hist_text(xloc,0.82,mult(i).kf.str_r1)
    func_hist_text(.92,0.92,'T_1','tex')
    
    switch i
        case 1; ylim([0 600]);
        case 2; ylim([0 650]);
        case 3; ylim([0 500]);
    end
    
    % --- T_3 --- %
    subplot(4,2,2*i)
    h1 = histogram(mult(i).kf.eTr2);
    hold on
    h2 = histogram(mult(i).ekf.eTr2);
    xlim([-xlims xlims])
    xlabel('Error (\circC)'); 
    ylabel('Number of points'); 
    h1.BinWidth = .1; % uniform bin widths
    h2.BinWidth = .1;
    if i == 4; hleg = legend([h1,h2],'KF with T_3','EKF with Z'''''); end
    
    % Text
    func_hist_text(xloc,0.92,mult(i).ekf.str_r2)
    func_hist_text(xloc,0.82,mult(i).kf.str_r2)
    func_hist_text(.92,0.92,'T_3','tex')
    
end
tightfig;
flushLegend(hleg,'southeast');




