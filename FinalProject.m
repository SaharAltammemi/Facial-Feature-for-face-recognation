function varargout = untitled(varargin)
% UNTITLED MATLAB code for untitled.fig
%      UNTITLED, by itself, creates a new UNTITLED or raises the existing
%      singleton*.
%
%      H = UNTITLED returns the handle to a new UNTITLED or the handle to
%      the existing singleton*.
%
%      UNTITLED('CA
%LLBACK,hObject,eventData,handles,...) calls the local
%      function named CALLBACK in UNTITLED.M with the given input arguments.
%
%      UNTITLED('Property','Value',...) creates a new UNTITLED or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before untitled_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to untitled_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help untitled

% Last Modified by GUIDE v2.5 20-Jun-2020 16:52:06

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @untitled_OpeningFcn, ...
                   'gui_OutputFcn',  @untitled_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end

%global im;
% End initialization code - DO NOT EDIT
% --- Executes just before untitled is made visible.
function untitled_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to untitled (see VARARGIN)

% Choose default command line output for untitled
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes untitled wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = untitled_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
 

% --- Executes on button press in pushbutton1.

function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im
[fileName , pathName]=uigetfile({'*.pgm';'*.jpg';'*.jpeg';'*.bmp';'*.png'},'select test image');
 file=strcat(pathName , fileName);
 axes(handles.axes1)
 im=imread(file);
 imshow(im)
% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
d= load('DatasetHOG.mat');
global im;
classes=d.datasetHOG(:,end);
dataset=d.datasetHOG(:,1:end-1);
 img=rgb2gray(im);
 H=HOG(img);
 H=(H)';
%[featureVector,hogVisualization] = extractHOGFeatures(img);
%calculat distans (knn)
dis=zeros(60,2);
for i=1:60
    D  = sqrt(sum(( dataset(i,1:end)- H) .^ 2));
    dis(i,1)=D;
    dis(i,2)=classes(i,end);
end
dis = sortrows(dis,1);
%display images
x=0;
for i=1:10
 if dis(1,2)==i
     im1=imread(['E:\fainal\ImagesDataSet\training\s' num2str(1+x) '.png']);
     im2=imread(['E:\fainal\ImagesDataSet\training\s' num2str(2+x) '.png']);
     im3=imread(['E:\fainal\ImagesDataSet\training\s' num2str(3+x) '.png']);
     im4=imread(['E:\fainal\ImagesDataSet\training\s' num2str(4+x) '.png']);
     axes(handles.axes8);
     imshow(im1);
     axes(handles.axes10);
     imshow(im2);
     axes(handles.axes12);
     imshow(im3);
     axes(handles.axes14);
     imshow(im4);
 %else  f = warndlg("fialer");
 end
 axes(handles.axes8)
    %cla
    x=x+6;
end
 
% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% --- Executes on button press in pushbutton4.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Jason Joseph Rebello
% Carnegie Mellon University (Jan 2012 - May 2013) 
% MS in Electrical & Computer Engineering
% Principal Component Analysis
d=load('DatasetHarrise.mat');
global im;
classes=d.datasetHarrise(:,end);
dataset=d.datasetHarrise(:,1:end-1);
img=rgb2gray(im);
harrispoints = detectHarrisFeatures(img);
[harris,validPoints] = extractFeatures(img,harrispoints);
result=mean(harris.Features);
%calculat distans (knn)
dis=zeros(60,2);
for i=1:60
    D  = sqrt(sum(( dataset(i,1:end)- result).^2)) ;
    dis(i,1)=D;
    dis(i,2)=classes(i,end);
end
dis = sortrows(dis,1);
%display images
x=0;
for i=1:10
 if dis(1,2)==i
    im1=imread(['E:\fainal\ImagesDataSet\training\s' num2str(1+x) '.png']);
     im2=imread(['E:\fainal\ImagesDataSet\training\s' num2str(2+x) '.png']);
     im3=imread(['E:\fainal\ImagesDataSet\training\s' num2str(3+x) '.png']);
     im4=imread(['E:\fainal\ImagesDataSet\training\s' num2str(4+x) '.png']);
     axes(handles.axes8);
     imshow(im1);
     axes(handles.axes10);
     imshow(im2);
     axes(handles.axes12);
     imshow(im3);
     axes(handles.axes14);
     imshow(im4);
 end
        axes(handles.axes8)
   % cla
    x=x+6;
end
  
% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
d= load('DatasetLBP.mat');
global im;
classes=d.datasetLBP(:,end);
dataset=d.datasetLBP(:,1:end-1);
 img=rgb2gray(im);
f = extractLBPFeatures(img);
%calculat distans (knn)
dis=zeros(60,2);
for i=1:60
    D  = sqrt(sum(( dataset(i,1:end)- f) .^ 2));
    dis(i,1)=D;
    dis(i,2)=classes(i,end);
end
dis = sortrows(dis,1);
%display images
x=0;
for i=1:10
 if dis(1,2)==i
     im1=imread(['E:\fainal\ImagesDataSet\training\s' num2str(1+x) '.png']);
     im2=imread(['E:\fainal\ImagesDataSet\training\s' num2str(2+x) '.png']);
     im3=imread(['E:\fainal\ImagesDataSet\training\s' num2str(3+x) '.png']);
     im4=imread(['E:\fainal\ImagesDataSet\training\s' num2str(4+x) '.png']);
     axes(handles.axes8);
     imshow(im1);
     axes(handles.axes10);
     imshow(im2);
     axes(handles.axes12);
     imshow(im3);
     axes(handles.axes14);
     imshow(im4);
 end
        axes(handles.axes8)
   % cla
    x=x+6;
end
  
% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

 d= load('DatasetSURF.mat');
global im;
classes=d.datasetSURF(:,end);
dataset=d.datasetSURF(:,1:end-1);
img=rgb2gray(im);
points=detectSURFFeatures(img);
[Features,validPoints] = extractFeatures(img,points);
Features=mean(Features);
%calculat distans (knn)
dis=zeros(60,2);
for i=1:60
    D  = sqrt(sum(( dataset(i,1:end)- Features).^2)) ;
    dis(i,1)=D;
    dis(i,2)=classes(i,end);
end
dis = sortrows(dis,1);
%display images
x=0;
for i=1:10
 if dis(1,2)==i
   im1=imread(['E:\fainal\ImagesDataSet\training\s' num2str(1+x) '.png']);
     im2=imread(['E:\fainal\ImagesDataSet\training\s' num2str(2+x) '.png']);
     im3=imread(['E:\fainal\ImagesDataSet\training\s' num2str(3+x) '.png']);
     im4=imread(['E:\fainal\ImagesDataSet\training\s' num2str(4+x) '.png']);
     axes(handles.axes8);
     imshow(im1);
     axes(handles.axes10);
     imshow(im2);
     axes(handles.axes12);
     imshow(im3);
     axes(handles.axes14);
     imshow(im4);
 end
        axes(handles.axes8)
   % cla
    x=x+6;
end

% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function pushbutton5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
 % hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
f = warndlg("failer");
handles.test1.String = 'Please wait...Loading data...';
drawnow;


% --- Executes on button press in pushbutton9.
function pushbutton11_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
d= load('DatasetLbpHog.mat');
global im;
classes=d.datasetLbpHog(:,end);
dataset=d.datasetLbpHog(:,1:end-1);
img=rgb2gray(im);
H=HOG(img);
 H=(H)';
f = extractLBPFeatures(img);
vector=[f , H];
%calculat distans (knn)
dis=zeros(60,2);
for i=1:60
    D  = sqrt(sum(( dataset(i,1:end)- vector) .^ 2));
    dis(i,1)=D;
    dis(i,2)=classes(i,end);
end
dis = sortrows(dis,1);
%display images
x=0;
for i=1:10
 if dis(1,2)==i
     im1=imread(['E:\fainal\ImagesDataSet\training\s' num2str(1+x) '.png']);
     im2=imread(['E:\fainal\ImagesDataSet\training\s' num2str(2+x) '.png']);
     im3=imread(['E:\fainal\ImagesDataSet\training\s' num2str(3+x) '.png']);
     im4=imread(['E:\fainal\ImagesDataSet\training\s' num2str(4+x) '.png']);
     axes(handles.axes8);
     imshow(im1);
     axes(handles.axes10);
     imshow(im2);
     axes(handles.axes12);
     imshow(im3);
     axes(handles.axes14);
     imshow(im4);
 end
        axes(handles.axes8)
   % cla
    x=x+6;
end
% --- Executes on button press in pushbutton10.
function pushbutton10_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
d=load('DatasetPCA.mat');
global im;
classes=d.datasetPCA(:,end);
dataset=d.datasetPCA(:,1:end-1);
img=rgb2gray(im);
img=double(img);
[coeff]= pca(img);
coeff=mean(coeff);
%calculat distans (knn)
dis=zeros(60,2);
for i=1:60
    D  = sqrt(sum(( dataset(i,1:end)- coeff).^2)) ;
    dis(i,1)=D;
    dis(i,2)=classes(i,end);
end
dis = sortrows(dis,1);
%display images
x=0;
for i=1:10
 if dis(1,2)==i
    im1=imread(['E:\fainal\ImagesDataSet\training\s' num2str(1+x) '.png']);
     im2=imread(['E:\fainal\ImagesDataSet\training\s' num2str(2+x) '.png']);
     im3=imread(['E:\fainal\ImagesDataSet\training\s' num2str(3+x) '.png']);
     im4=imread(['E:\fainal\ImagesDataSet\training\s' num2str(4+x) '.png']);
     axes(handles.axes8);
     imshow(im1);
     axes(handles.axes10);
     imshow(im2);
     axes(handles.axes12);
     imshow(im3);
     axes(handles.axes14);
     imshow(im4);
 end
        axes(handles.axes8)
   % cla
    x=x+6; 
end
