function [final] = InfoGain(table,lable)
    prior_prob=table/size(lable,1);           %Pr(c_i)  :is prior probabilty of ith class.
    conditional_prob=table/size(table,1); %pr(c_i|t):is conditional probability of ith class                                        
    complment_prob=1-conditional_prob;                 %Pr(~t)   :is complment probabilty of term t
    total_prob_oft=table/size(lable,1);  %Pr(t)    :is probability of term t in a given data set..
    conditional_complyment=1-total_prob_oft;%Pr(~c_i|t):is conditional complementry probabilty of ith class.
    sum_efig=0;
    sum1=0;
    sum2=0;

    for j=1:size(table,1)
       % for k = 1:size(table,2)
           sum_efig = (prior_prob.*log2(prior_prob))+sum_efig;
       % end
    end
    %end of calculation of first part of IG equation
    for l=1:size(table,1)
          for matrix_inputdta=1:size(table,2)  

             sum1= ( conditional_prob.*log2(conditional_prob))+sum1;            
          end

    end
    %end of calculation of second part of IG equation.
       for d= 1:size(table,1)
            for n=1:size(table,2)
                   sum2= complment_prob.*log2(complment_prob)+sum2; 
            end
       end
         ig = sum_efig;
         ig1=total_prob_oft.*sum1;
         ig2=conditional_complyment.*sum2;
         IG=-(ig)+(ig1)+(ig2);
         final=sort(IG);
end

