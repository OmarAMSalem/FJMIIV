function [data,idealvec_s]=normdata(mydata)
    %scaling data between [0,1]
    t=size(mydata,2)-1;
    l=max(mydata(:,end));
    tmp=[];
 
for k=1:l
    idealvec_s(k,:)=mean(mydata(find(mydata(:,end)==k),1:t));
end

data_v=mydata(:,1:t);
data_c=mydata(:,t+1); %labels
mins_v = min(data_v);
Ones = ones(size(data_v));
data_v = data_v+Ones*diag(abs(mins_v));
for k=1:l
    tmp=[tmp;abs(mins_v)];
end
tmp;
idealvec_s = idealvec_s+tmp;
maxs_v = max(data_v);
data_v = data_v*diag(maxs_v.^(-1));
idealvec_s=idealvec_s./repmat(maxs_v,l,1);
data = [data_v, data_c];
end
