%QPLOT Plot Baxter robot joint angles
%
% QPLOT(Q) is a convenience function to plot joint angle trajectories (Mx7) for 
% a 7-axis robot, where each row represents one time step.
%
% The first four joints are shown as solid lines, the last three joints (wrist)
% are shown as dashed lines.  A legend is also displayed.
%
% QPLOT(T, Q) as above but displays the joint angle trajectory versus time
% given the time vector T (Mx1).

% The function is modified from qplot of 
% The Robotics Toolbox for MATLAB (RTB).
% RTB is free software: you can redistribute it and/or modify
% it under the terms of the GNU Lesser General Public License as published by
% the Free Software Foundation, either version 3 of the License, or
% (at your option) any later version.
% 

function baxter_qsubplot_step(t, q)
    if nargin < 2
        q = t;
        t = (1:numrows(q))';
    end
    %clf
    
    % Create basic plot
   
    figure('Position',[638   580   746   297]);hold on; hData1 = plot(t, q(:,1),'-', t, q(:,8), '--'); hold on; hXLabel1 = xlabel('t (s)'); hYLabel1 = ylabel('q_1 (rad)');legend('Ref q_1', 'Model q_1');
    grid on
    set(gca, 'Box', 'on', 'TickDir', 'out', 'TickLength', [.02 .02], ...
    'XMinorTick', 'on', 'YMinorTick', 'on', 'YGrid', 'on', ...
    'XColor', [.3 .3 .3], 'YColor', [.3 .3 .3], ...
    'LineWidth', 1)
    xlim([t(1), t(end)]);
    set(hData1,  'Color',  'r', 'LineWidth', 2);
    set([hXLabel1, hYLabel1], 'FontSize', 12)
    
     set(gcf,'PaperPositionMode','auto');
     print -depsc2 joint1step.eps
     close;
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    figure('Position',[638   580   746   297]);hold on; 
    hData2 = plot(t, q(:,2),'-', t, q(:,9), '--');hold on; hXLabel2 = xlabel('t (s)'); hYLabel2 = ylabel('q_2 (rad)');legend('Ref q_2', 'Model q_2');
    grid on
    set(gca, 'Box', 'on', 'TickDir', 'out', 'TickLength', [.02 .02], ...
    'XMinorTick', 'on', 'YMinorTick', 'on', 'YGrid', 'on', ...
    'XColor', [.3 .3 .3], 'YColor', [.3 .3 .3], ...
    'LineWidth', 1)
    xlim([t(1), t(end)]);
    set(hData2,  'Color',  [0 0.5 0], 'LineWidth', 2);
    set([hXLabel2, hYLabel2], 'FontSize', 12)
    
     set(gcf,'PaperPositionMode','auto');
     print -depsc2 joint2step.eps
     close;
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%
    figure('Position',[638   580   746   297]);hold on; 
    hData3 = plot(t, q(:,3),'-', t, q(:,10), '--');hold on; hXLabel3 = xlabel('t (s)'); hYLabel3 = ylabel('q_3 (rad)');legend('Ref q_3', 'Model q_3');
    grid on
    set(gca, 'Box', 'on', 'TickDir', 'out', 'TickLength', [.02 .02], ...
    'XMinorTick', 'on', 'YMinorTick', 'on', 'YGrid', 'on', ...
    'XColor', [.3 .3 .3], 'YColor', [.3 .3 .3], ...
    'LineWidth', 1)
    xlim([t(1), t(end)]);
    set(hData3,  'Color',  'b', 'LineWidth', 2);
    set([hXLabel3, hYLabel3], 'FontSize', 12)
    
     set(gcf,'PaperPositionMode','auto');
     print -depsc2 joint3step.eps
     close;
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    
    figure('Position',[638   580   746   297]);hold on; 
    hData4 = plot(t, q(:,4),'-', t, q(:,11), '--');hold on; hXLabel4 = xlabel('t (s)'); hYLabel4 = ylabel('q_4 (rad)');legend('Ref q_4', 'Model q_4');
    set(gca, 'Box', 'on', 'TickDir', 'out', 'TickLength', [.02 .02], ...
    'XMinorTick', 'on', 'YMinorTick', 'on', 'YGrid', 'on', ...
    'XColor', [.3 .3 .3], 'YColor', [.3 .3 .3], ...
    'LineWidth', 1)
    xlim([t(1), t(end)]);    
    set(hData4,  'Color',  'c', 'LineWidth', 2);
    set([hXLabel4, hYLabel4], 'FontSize', 12)
     set(gcf,'PaperPositionMode','auto');
     print -depsc2 joint4step.eps
     close;
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    
    figure('Position',[638   580   746   297]);hold on; 
    hData5 = plot(t, q(:,5),'-', t, q(:,12), '--');hold on; hXLabel5 = xlabel('t (s)'); hYLabel5 = ylabel('q_5 (rad)');legend('Ref q_5', 'Model q_5');
    set(gca, 'Box', 'on', 'TickDir', 'out', 'TickLength', [.02 .02], ...
    'XMinorTick', 'on', 'YMinorTick', 'on', 'YGrid', 'on', ...
    'XColor', [.3 .3 .3], 'YColor', [.3 .3 .3], ...
    'LineWidth', 1)
    xlim([t(1), t(end)]);    
    set(hData5,  'Color', 'm', 'LineWidth', 2);
    set([hXLabel5, hYLabel5], 'FontSize', 12)
     set(gcf,'PaperPositionMode','auto');
     print -depsc2 joint5step.eps
     close;
    
     %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        figure('Position',[638   580   746   297]);hold on; 
        hData6 = plot(t, q(:,6),'-', t, q(:,13), '--');hold on; hXLabel6 = xlabel('t (s)'); hYLabel6 = ylabel('q_6 (rad)');legend('Ref q_6', 'Model q_6');
    set(gca, 'Box', 'on', 'TickDir', 'out', 'TickLength', [.02 .02], ...
    'XMinorTick', 'on', 'YMinorTick', 'on', 'YGrid', 'on', ...
    'XColor', [.3 .3 .3], 'YColor', [.3 .3 .3], ...
    'LineWidth', 1)
    xlim([t(1), t(end)]);    
     set(hData6,  'Color', 'y', 'LineWidth', 2);
    set([hXLabel6, hYLabel6], 'FontSize', 12)
    
    set(gcf,'PaperPositionMode','auto');
     print -depsc2 joint6step.eps
     close;
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    figure('Position',[638   580   746   297]);hold on; 
    hData7 = plot(t, q(:,7),'-', t, q(:,14), '--');hold on; hXLabel7 = xlabel('t (s)'); hYLabel7 = ylabel('q_7 (rad)');legend('Ref q_7', 'Model q_7');
    set(gca, 'Box', 'on', 'TickDir', 'out', 'TickLength', [.02 .02], ...
    'XMinorTick', 'on', 'YMinorTick', 'on', 'YGrid', 'on', ...
    'XColor', [.3 .3 .3], 'YColor', [.3 .3 .3], ...
    'LineWidth', 1)
    xlim([t(1), t(end)]);    
     set(hData7,  'Color', 'k', 'LineWidth', 2);
     set([hXLabel7, hYLabel7], 'FontSize', 12)
     set(gcf,'PaperPositionMode','auto');
     print -depsc2 joint7step.eps
     close;

