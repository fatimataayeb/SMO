function [LL,GL] = SetInitialLeaders(SM,GL,LL,confg)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

    for i=1:confg.nPop 
        %Form the groups 
        grpNo=1+floor((i-1)/confg.grpSize);
        if mod(i,confg.grpSize)==1
            %Set the Local Leader
            LL(grpNo)=SM(i);
        end
        
        %Choose Local Leader by Greedy Search 
        if SM(i).Cost>LL(grpNo).Cost
            LL(grpNo)=SM(i);
        end
    end
    
    %Choose Global Leader by Gready Search 
    for i=1:confg.nGrp
        if LL(i).Cost>GL.Cost
            GL=LL(i);
        end
    end
    GL.LimitCount=0;
    
end

