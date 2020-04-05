function [ GL,LL,confg] = GlobalLeaderDecisionPhase( SM,GL,LL,confg )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
    
    if GL.LimitCount>=confg.GlobalLimitCount
        if confg.nGrp<confg.MaxGrps
            confg.nGrp=confg.nGrp+1;
            confg.grpSize=ceil(confg.nPop/confg.nGrp);
            [LL,GL] = SetInitialLeaders(SM,GL,LL,confg);
            GL.LimitCount=0;
        else
            GL.LimitCount=0;
            confg.nGrp=1;
            confg.grpSize=ceil(confg.nPop/confg.nGrp);
        end
    end
    
end

