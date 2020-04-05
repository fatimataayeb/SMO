function SM = LocalLeaderPhase( SM,LL,confg )
%UNTITLED7 Summary of this function goes here
%   sm = sm + u(0,1)(ll-sm) + u(-1,1)(sm'-sm)
%   sm = sm XOR (( b AND (ll XOR sm)) OR ( d AND ( sm' XOR sm))) 

    for i=1:confg.nPop
        
        prDim=ceil(unifrnd(0,1,[1,confg.nVar])-confg.PR); % rand>= pr  ( if true 1 , of false 0 ) for 2000 genes
        
        grpNo=1+floor((i-1)/confg.grpSize);
        r=notThisInRange((grpNo-1)*confg.grpSize+1,min(grpNo*confg.grpSize,confg.nPop),i);
        b = randi([0,1] ,1,confg.nVar);
        d = randi([0,1],1,confg.nVar);
        
        %for each dimension
        
        newPosition = prDim .* xor (SM(i).Position ,(( b & ( xor (LL(grpNo).Position , SM(i).Position)) | ( d & ( xor (SM(r).Position , SM(i).Position))))));
        %do not pass empty array 
        if sum(newPosition)~= 0 
            newCost = CostFunction(newPosition);
             if newCost > SM(i).Cost
                 SM(i).Position = newPosition;
                 SM(i).Cost = newCost;
             end
        end
       
        
    end

end
%.*(unifrnd(0,1,[1,confg.nVar]).*(LL(grpNo).Position-SM(i).Position) + unifrnd(-1,1,[1,confg.nVar]).*(SM(r).Position-SM(i).Position));
