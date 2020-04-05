function plotData( SM,GL,LL,confg )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    A=zeros(1,confg.nPop);
    B=zeros(1,confg.nPop);
    Z1=zeros(1,confg.nPop);
    C=zeros(1,confg.nGrp);
    D=zeros(1,confg.nGrp);
    Z2=zeros(1,confg.nGrp);
    
    %COLOR DEFINITIONS FOR GROUPS (MAX : 20)
    grpColor=[230, 25, 75; 60, 180, 75; 255, 225, 25; 0, 130, 200; 245, 130, 48; 145, 30, 180; 70, 240, 240; 240, 50, 230; 210, 245, 60; 250, 190, 190; 0, 128, 128; 170, 110, 40; 128, 0, 0; 128, 128, 0; 120 150 180; 150 180 210;];
    grpColor=grpColor./256;
    
    RGB = repmat([0],confg.nPop,3);
    RGB2 = repmat([0],confg.nGrp,3);
    
    for i=1:confg.nPop
        grpNo=1+floor((i-1)/confg.grpSize);
        RGB(i,:)=grpColor(grpNo,:);
        A(i)=SM(i).Position(1);
        B(i)=SM(i).Position(2);
        Z1(i)=grpNo;
        if mod(i,confg.grpSize)==1
            C(grpNo)=LL(grpNo).Position(1);
            D(grpNo)=LL(grpNo).Position(2);
            RGB2(grpNo,:)=grpColor(grpNo,:);
            Z2(grpNo)=grpNo;
        end
    end
    
    scatter3(C,D,Z2,100,RGB2,'*');
    hold on;
    grid on;
    scatter3(A,B,Z1,10,RGB);
    scatter3(GL.Position(1),GL.Position(2),0,80,[0 0 0],'d');
    hold off;
    set(gca,'XLim',[-50 50],'YLim',[-50 50],'ZLim',[-1 20])
   
%         /~\
%        C oo
%        _( ^)
%       /   ~\
    
    pause(0.1);
    
end

