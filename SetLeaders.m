function [LL,GL] = SetLeaders(SM,GL,LL,confg)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

    for i=1:confg.nPop 
        grpNo=1+floor((i-1)/config.grpSize);
        
        if Dominates(SM(i).Cost,LL(grpNo).Cost)
            LL(grpNo)=SM(i);
        end
    end
    
    for i=1:confg.nGrp
        if Dominates(LL(i).Cost,GL.Cost)
            GL=LL(i);
            GL.LimitCount=0;
        end
    end
    
end

