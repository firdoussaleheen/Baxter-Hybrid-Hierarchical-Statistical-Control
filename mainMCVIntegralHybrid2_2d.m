%% Code Author: Firdous Saleheen -- f.saleheen@temple.edu
% no permission necessary for non-commercial use
% Date: 7/27/2013
clear all;
close all;
clc;
% format shortg
% 
% disp('start')
% stair2dscan trajectory data
load('baxter_lin_pert_model5.mat');

% run LoadParameters1
% run LoadnCheckModel
%% Baxter left arm model
Apl = sys_mimo_left.A;
Bpl = sys_mimo_left.B;
Cpl = sys_mimo_left.C;
Cpl = [Cpl(1:7,1:7),zeros(7);zeros(7), zeros(7)];
Dpl = sys_mimo_left.D;
ql0 = sys_mimo_left.UserData{2};
chksys(Apl,Bpl,Cpl)
W = 1e-6; gamma = 0.9;Fpl = eye(14);

[Kplmcv, elmcv] = MCVController(Apl,Bpl,Cpl,Dpl,Fpl,W,gamma);
%% Baxter right arm model
Apr = sys_mimo_right.A;
Bpr = sys_mimo_right.B;
Cpr = sys_mimo_right.C;
Cpr = [Cpr(1:7,1:7),zeros(7);zeros(7), zeros(7)];
Dpr = sys_mimo_right.D;
qr0 = sys_mimo_right.UserData{2};
chksys(Apr,Bpr,Cpr)
%W = (1e-2)/2; gamma = 0.1;
Fpr = eye(14);
[Kprmcv, ermcv] = MCVController(Apr,Bpr,Cpr,Dpr,Fpr,W,gamma);

%% Add compensator and integrator

% Design of precompensator
Nbar = rscalemultinput(Apl,Bpl,Cpl,Dpl,Kplmcv);

% Closed loop system with precompensator
Ahat = Apl-Bpl*Kplmcv;
% With noise
Fhat = Fpl(1:end,1:7);

% Without noise
%Fhat =  zeros(14,7);

% Input ref joint angles and process noise
Bhat = [Bpl*Nbar, Fhat];

% Full-state feedback
Chat = eye(14,14);
Dhat = zeros(14,14);

Khat = Kplmcv;

% add integrator and augment system
Aaug = [Ahat, zeros(14,7);Cpl(1:7,1:14), zeros(7)];
Baug = [Bpl*Nbar Fhat; eye(7), zeros(7)];
Caug = [eye(14),zeros(14,7)];
Daug = zeros(14,14);

%%
% Design of precompensator
Nbar1 = rscalemultinput(Apr,Bpr,Cpr,Dpr,Kprmcv);

% Closed loop system with precompensator
Ahat1 = Apr-Bpr*Kprmcv;
% With noise
Fhat1 = Fpr(1:end,1:7);

% Without noise
%Fhat1 =  zeros(14,7);

% Input ref joint angles and process noise
Bhat1 = [Bpr*Nbar1, Fhat1];

% Full-state feedback
Chat1 = eye(14,14);
Dhat1 = zeros(14,14);

Khat1 = Kprmcv;

% add integrator and augment system
Aaug1 = [Ahat1, zeros(14,7);Cpr(1:7,1:14), zeros(7)];
Baug1 = [Bpr*Nbar1 Fhat1; eye(7), zeros(7)];
Caug1 = [eye(14),zeros(14,7)];
Daug1 = zeros(14,14);



%%
% initleft = [0+pi/4 0.7854+pi/4   1.5708+pi/4     pi/4    0.7854+pi/4     0+pi/4      0+pi/4 ...
%               0.01   0.01        0.01        0.01      0.01      0.01      0.01].';

% Initial joint angles (left)
%initleft = [-(0+pi/8) -(0.7854+pi/8)   -(1.5708+pi/8)     3*pi/8    0.7854+pi/8     0+pi/8      0+pi/8 ...
%              0.0   0.0        0.0        0.0      0.0      0.0      0.0 ...
%              0.0   0.0        0.0        0.0      0.0      0.0      0.0].';
% 
% from expt
% initleft = [-(0.36816+pi/128)     -(0.55722+pi/128)      -(1.1969+pi/128)      1.5731+pi/128 ...     
% 0.99057+pi/128       1.2609+pi/128      0.60746+pi/128 ...
%               0.0   0.0        0.0        0.0      0.0      0.0      0.0 ...
%               0.0   0.0        0.0        0.0      0.0      0.0      0.0].';

% trajectory expt
initleft = [jlanglerow1(:,1)'+ 0.1*ones(1,7), zeros(1,14)];

% Initial joint angles (right)
%initright = [-(0+pi/8) -(0.7854+pi/8)   -(1.5708+pi/8)     3*pi/8    0.7854+pi/8     0+pi/8      0+pi/8 ...
%              0.0   0.0        0.0        0.0      0.0      0.0      0.0 ...
%              0.0   0.0        0.0        0.0      0.0      0.0      0.0].';

% from expt
% initright=[ 1.1785+pi/128       1.6648+pi/128       1.1892+pi/128      -(0.7505+pi/128) ...
%     0.17948+pi/128       -(0.581+pi/128)     -(0.96871+pi/128) ...
%     0.0   0.0        0.0        0.0      0.0      0.0      0.0 ...
%     0.0   0.0        0.0        0.0      0.0      0.0      0.0].';

initright = [jranglerow1(:,1)'+ 0.1*ones(1,7),zeros(1,14)];
% simulink simulation start time
steptime = 0.0;

% When ref = 0
% stepinput = zeros(7,1);

% When ref NOT = 0
stepinput = [-0.36816     -0.55722      -1.1969       1.5731      0.99057       1.2609      0.60746].';
% ref joint velocity zero
stepinput1=zeros(7,1);
%stepinput =1*ones(7,1);

stepinput2 = [-0.36816     -0.55722      -1.1969       1.5731      0.99057       1.2609      0.60746].';
% expt
%stepinput2 = [1.1785       1.6648       1.1892      -0.7505      0.17948       -0.581     -0.96871].';

% Process noise covariance (trial and error)
%W = 1e-6;
stoptime = 1795;% seconds, sufficient for bdi expt
faulttime = stoptime;
dt = 0.001;
%seed = round(100*sum(clock)); % randomized seed for random number generation
seed = 0;
runs = 1; % number of runs
simName = {'baxter_hybridcontroltraj3_2d'};
[avgstatesmcv, timemcv] = simStates(runs,simName);
timemcv = timemcv(:,1);
%%
jl11data = avgstatesmcv;
rmsesdexyz(jl0data(3001:end,42:44))
sdexyzm(jl0data(3001:end,42:44))

