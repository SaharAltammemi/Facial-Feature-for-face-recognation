clear
clc
d1= load('DatasetLBP.mat');
d2= load('DatasetHOG.mat'); 
dataset1=d1.datasetLBP(:,1:end-1);
dataset2=d2.datasetHOG(:,1:end-1);
datasetLbpHog=zeros(60 , 140 +1);
c=1;
for i=1:10
    for j=1:6
        datasetLbpHog(c ,1:end -1)=[dataset1(c,:), dataset2(c,:)];
        datasetLbpHog(c,end)=i;
        c=c+1;
    end 
end
save('DatasetLbpHog','datasetLbpHog')