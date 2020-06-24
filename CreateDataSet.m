clear
clc
datasetHOG=zeros(60 , 81 +1);
datasetLBP=zeros(60 , 59 +1);
datasetHarrise=zeros(60 , 64 +1 );
datasetPCA=zeros(60 , 242 +1);
datasetSURF=zeros(60, 64+1);
c=1;
for i=1:10
    for j=1:6
        image=imread(['E:Fainal\ImagesDataSet\training\s' num2str(c) '.png'] );
        image=rgb2gray(image);
        %%%%%%%%%%%%%%%%%%%%%harris
        harrispoints = detectHarrisFeatures(image);
        [harris,validPoints] = extractFeatures(image,harrispoints);
        result=mean(harris.Features);
        datasetHarrise(c ,1:end -1)=result;
        datasetHarrise(c,end)=i;
        %%%%%%%%%%%%%%%%%%%%%%furf
        points=detectSURFFeatures(image);
        [Features,validPoints] = extractFeatures(image,points);
        Features=mean(Features);
        datasetSURF(c , 1:end-1 )=Features;
        datasetSURF(c,end)=i;
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%HOG
        H = HOG(image);
        datasetHOG(c ,1:end -1)=(H)';
        datasetHOG(c,end)=i;
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%LBP
        features = extractLBPFeatures(image);
        datasetLBP(c ,1:end -1)=features;
        datasetLBP(c,end)=i;
        %%%%%%%%%%%%%%%PCA
        im1=double(image);
        [coeff]= pca(im1);
        resultPCA=mean(coeff);
        datasetPCA(c ,1:end -1)=resultPCA;
        datasetPCA(c,end)=i;
        c=c+1;
     end
end
%save('DatasetHOG','datasetHOG')
%save('DatasetLBP','datasetLBP')
%save('DatasetHarrise','datasetHarrise')
%save('DatasetPCA','datasetPCA')
%save('DatasetSURF','datasetSURF')