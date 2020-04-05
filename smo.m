clc;
clear;
close all;
rng(1);

%% MONKEY DEFINITION
empty_particle.Position=[];
empty_particle.Cost=[];
empty_particle.LimitCount=[];

%% GENERAL CONFIGURATION
config;
confg = repmat(empty_config,1,1);
confg.nVar = 30;
confg.nPop = 50;
confg.nGrp = 5;
confg.MaxGrps = 5;
confg.MaxIt=25;
confg.LocalLimitCount = 150;
confg.GlobalLimitCount = 25;
confg.PR = 0.3;
confg.grpSize=ceil(confg.nPop/confg.nGrp);


%% Filter Method (RelieF)
%Rank features based on statsical technique and get top 30 features

rankGenes(confg.nVar);

%% SMO

SM = repmat(empty_particle,confg.nPop,1);
LL = repmat(empty_particle,confg.nPop,1);
GL = repmat(empty_particle,1,1);
SM = Initialize(SM,confg);
GL.Cost=-Inf;
[LL,GL] = SetInitialLeaders(SM,GL,LL,confg);

costs = zeros (1,confg.MaxIt); 
iter = zeros (1,confg.MaxIt); 
features = zeros (1,confg.MaxIt); 


for run=1:1 
    
    for it=1:confg.MaxIt
        
        SM = LocalLeaderPhase(SM,LL,confg);
        SM = GlobalLeaderPhase(SM,GL,confg);
        LL = LocalLeaderLearningPhase(SM,LL,confg);
        GL = GlobalLeaderLearningPhase(GL,LL,confg);
        [SM,LL] = LocalLeaderDecisionPhase(SM,GL,LL,confg);
        [GL,LL,confg] = GlobalLeaderDecisionPhase(SM,GL,LL,confg);
        
        fmt=['Solution = ' repmat('%d',1,numel( GL.Position))];
        
        fprintf('Iteration=%d Cost=%f No of Features: %d \n',it,GL.Cost, sum(GL.Position));
        costs(it)= GL.Cost;
        iter(it)= it; 
        features(it) = sum(GL.Position);
        %fprintf(fmt, GL.Position);
        plot(iter,costs);
        %plotData(SM,GL,LL,confg);
     
    end
    
end