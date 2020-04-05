function  status = Dominates( A,B )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
    status=false;
    D=B-A;
    if A<B & D>=0.00000001
        status=true;
    end

end

