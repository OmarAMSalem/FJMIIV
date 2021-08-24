% This is the main function (FJMIIV). FJMIIV calculates the goal function
% based on the fuzzy joint mutual information. % We reused the source code of the original work (see FH, normdata, simRelation) of Pasi Luukka (2021). Feature selection using fuzzy entropy measures and similarity (https://www.mathworks.com/matlabcentral/fileexchange/31366-feature-selection-using-fuzzy-entropy-measures-and-similarity), MATLAB Central File Exchange. Retrieved August 23, 2021.
%Input: data (dataset, set of features and class label) %Output: best_fs (index of best selected features)
function [best_fs]=FJMIIV(data)

NF = size(data,2) - 1;
I_Cx = zeros(1,NF);

relc = simRelation([data(:,end) data(:,end)],1);
HC=FH(relc);
[sim] = simRelation(data,1);
max_MI=0;firstFeature=1;

% calculate the fuzzy mutual information of each feature with the class
for i=1:NF
 I_Cx(i)=FFMI2(sim(:,i),relc,HC);
    if I_Cx(i)> max_MI
        max_MI=I_Cx(i);
        firstFeature=i;
    end
end

% select the first feature 
best_fs(1)=firstFeature;
best_val(1)=max_MI;
% intial the repesentative matrix
SN=sim(:,firstFeature);

selected=zeros(1,NF);
selected(best_fs(1))=1;
% select the remaining candidate features
for n=2:size(data,2)-1
    max_IcSNx=0;
    bestFeature=0;
    for i=1:NF
       if selected(i) continue;end;
       [relxn]= sim(:,i);
       
    I_SNxc=FFMI3(relxn,SN,relc,HC,I_Cx(i));
    I_CSN=FFMI2(SN,relc,HC);
    JRes=I_Cx(i)+I_CSN-I_SNxc;
    
       if JRes>max_IcSNx
           max_IcSNx=JRes;
           bestFeature=i;
       end
       
    end
  
    if max_IcSNx <= best_val(n-1) 
        break; 
    end
    
    best_fs(n)=bestFeature;
    SN=min(SN,sim(:,bestFeature));
    selected(bestFeature)=1;
    best_val(n)=max_IcSNx;

end
end
 
