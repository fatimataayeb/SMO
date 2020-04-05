function Fitness = calcFitness( SM,confg )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    Fitness = zeros(1,confg.nPop);
    for i=1:confg.nPop
        if SM(i).Cost>=0
            Fitness(i)=1/(1+SM(i).Cost);
        else
            Fitness(i)=1+abs(SM(i).Cost);
        end
    end

end

