function GL = GlobalLeaderLearningPhase(GL,LL,confg)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    
    isUpdated=false;
    for i=1:confg.nGrp
        if LL(i).Cost>GL.Cost
            GL=LL(i);
            GL.LimitCount=0;
            isUpdated=true;
        end
    end
    
    if isUpdated == false
        GL.LimitCount=GL.LimitCount+1;
    end

end

