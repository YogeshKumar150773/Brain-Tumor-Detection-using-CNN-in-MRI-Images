clc
clear all
img1=imread('GT108.png');
img1=rgb2gray(img1);
img2=imread('T_108.bmp');
img2=im2bw(img2);
figure 
imshow(img2)
m=bwlabel(img2);
o=bwlabel(img1);
reference=m;
toTest=o;
if(ndims(reference)~=2 && ndims(toTest)~=2) 
    error('Inputs must be two 2-dimensional matrices'); 
end 

 TP = numel(find(reference==1 & toTest==1)==1) 
  FP = numel(find(reference==0 & toTest==1)==1)
  TN = numel(find(reference==0 & toTest==0)==1)
  FN = numel(find(reference==1 & toTest==0)==1) 
P = TP + FN 
N = FP + TN 


TPrate = TP/P % True positive rate
TNrate = TN/N % true negative rate
FPrate = FP/N% False positive rate
FNrate = FN/P % False negative rate
if(TN==numel(reference))
    'gaga'
    Fvalue = 1;
    warning('FValue was set to 1 as all pixels were true negatives');
else
    Fvalue=2*TP/(FP+TP+P);
end
JaccardIndex = TP / (FP+TP+FN)
%JaccardDistance=1-JaccardIndex
dice=2*TP/((FP+TP)+(TP+FN))
sensitivity = TP/P
%recall=sensitivity= TPrate
recall=sensitivity;
specificity=TN/N
%specificity=TNrate
accuracy = (TP+TN)/(P+N)
precision =  TP/(TP+FP)
F1SCORE=(2*TP)/((2*TP)+FP+FN)
cc=bwconncomp(img1,8);
n=cc.NumObjects;
j=regionprops(cc,'Area','Perimeter','MajorAxisLength','MinorAxisLength','FilledArea');
