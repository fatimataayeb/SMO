function SM = GlobalLeaderPhase( SM,GL,confg )
%UNTITLED8 Summary of this function goes here
%   Detailed explanation goes here

    %FITNESS CALCULATION
    Fitness=calcFitness(SM,confg);
    prob=(0.9.*Fitness./max(Fitness))+0.1;
    
    for i=1:confg.nPop
        
        if rand>=prob(i)
            continue;
        end
        
        grpNo=1+floor((i-1)/confg.grpSize);
        r=notThisInRange((grpNo-1)*confg.grpSize+1,min(grpNo*confg.grpSize,confg.nPop),i);
        
        randDim=randi([1 confg.nVar]);
        b = randi([0,1]);
        d = randi([0,1]);
        
        newPosition = SM(i).Position;
        newPosition(randDim) = newPosition(randDim) | b &(xor(GL.Position(randDim),newPosition(randDim))) | ( d & (xor(SM(r).Position(randDim) , newPosition(randDim))));
        newCost = CostFunction(newPosition);
        
        if newCost > SM(i).Cost
            SM(i).Position = newPosition;
            SM(i).Cost = newCost;
        end
        
    end

end

