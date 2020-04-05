function LL = LocalLeaderLearningPhase(SM,LL,confg)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

    isUpdated = false;
    for i=1:confg.nPop
        
        grpNo=1+floor((i-1)/confg.grpSize);
        if SM(i).Cost > LL(grpNo).Cost
            LL(grpNo)=SM(i);
            LL(grpNo).LimitCount=0;
            isUpdated=true;
        end
        
        if (mod(i,confg.grpSize)==0 | i==confg.nPop) & isUpdated == false
            LL(grpNo).LimitCount=LL(grpNo).LimitCount+1;
        else
            isUpdated = false;
        end
        
    end

end

