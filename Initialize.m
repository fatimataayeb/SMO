function pop = Initialize ( pop,confg )
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
    
    for i=1:confg.nPop
        %Generate random binary array based on eq 1 
        chosenGenes = zeros(1,confg.nVar);
        for k=1:confg.nVar
            if rand > 0.5
                chosenGenes(k) = 1;
                
            end
        end
        
        pop(i).Position = chosenGenes;
        pop(i).Cost=CostFunction(pop(i).Position);
        pop(i).LimitCount=0;
    end

end

