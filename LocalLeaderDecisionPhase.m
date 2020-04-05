function [SM,LL] = LocalLeaderDecisionPhase( SM,GL,LL,confg )
%UNTITLED Summary of this function goes here
%If any Local Leader position is not updated up to a predetermined threshold called LocalLeaderLimit, then all the
%members of that group update their positions either by random initialization or by using combined information from
%Global Leader and Local Leader through equation (5), based on the pr.   

for i=1:confg.nGrp
    if LL(i).LimitCount>=confg.LocalLimitCount
        LL(i).LimitCount=0;
        to=min(i*confg.grpSize,confg.nPop);
        from=(i-1)*confg.grpSize+1;
        for k=from:to
            for dim=1:confg.nVar
                if rand >= confg.PR %Random Intiliazation
                    if rand>0.5
                        SM(k).Position(dim)= 1;
                    else
                        SM(k).Position(dim)= 0;
                    end
                else %use combined information from GL and LL to update position
                    r=notThisInRange(from,to,k);
                    %SM(k).Position(dim)=unifrnd(confg.VarMin(dim),confg.VarMax(dim));%x
                    b = randi([0,1]);
                    SM(k).Position(dim) = xor (SM(k).Position(dim) , b &(xor(LL(i).Position(dim),SM(r).Position(dim)))) | (b & (GL.Position(dim)-SM(k).Position(dim)));
                end
            end
            SM(k).Cost=CostFunction(SM(k).Position);
        end
        
        %LOCAL LEADER RESET
        LL(i).Cost=-Inf;
        LL(i).Position=zeros(1,confg.nVar);
        for k=from:to
            if SM(k).Cost>LL(i).Cost
                LL(i)=SM(k);
                LL(i).LimitCount=0;
            end
        end
        
    end
end
