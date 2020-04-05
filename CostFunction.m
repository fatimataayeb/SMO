function f = CostFunction( chosenGenes )
%Calculaate fitness of chosen features
%   Use SVM with linear kernel to get objective score
    f = getClassificationScore( chosenGenes );
    
    %TO DO -- experiment with diffrent cost functions 
    % cost = score / num of Features 
    
    

end

