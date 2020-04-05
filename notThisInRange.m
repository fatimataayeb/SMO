function r = notThisInRange( A,B,N )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

    %Influence from LL and Neighbour
    rSet = [A:N-1 N+1:B];
    r = rSet(randi([1 numel(rSet)]));

end

