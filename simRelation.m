function [sim] = simRelation(data,p)
l=max(data(:,end));     % #-classes
m=size(data,1);         % #-samples
t=size(data,2)-1;       % #-features
[data,idealvec_s]=normdata(data);

datalearn_s=data(:,1:t);

% similarities
sim=zeros(t,m,l);
for j=1:m
    for i=1:t
        for k=1:l
            sim(i,j,k)=(1-abs(idealvec_s(k,i)^p-datalearn_s(j,i))^p)^(1/p);
        end
    end
end

% reduce number of dimensions in sim
sim=reshape(sim,t,m*l)';
end

