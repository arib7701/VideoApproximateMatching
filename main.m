%  STRINGS ALGORITHM PROJECT 
% A SUFFIX ARRAY APPROACH TO VIDEO COPY DETECTION IN VIDEO SHARING SOCIAL NETWORKS 
%Spring 2018
%Sara Abdeldayem and Amandine Ribot
%clear all
%clc

%%
%reading the CHANGED video file and extract features
v = VideoReader('../videos/tieModif.mp4');
features=[];
featuresE = [];
countframeM = 0;
while hasFrame(v)
    countframeM = countframeM + 1 ;
    img = readFrame(v); 
    img = 0.2126 *img(:,:,1)+0.7152 *img(:,:,2)+0.0722*img(:,:,3);
    histimg = histcounts(img(:),32);
    cdf = cumsum(histimg)/sum(histimg);
    features = [features; cdf];
end
whos video
%%
%get the differences
features=abs(diff(features));
features=sum(features,2)./(v.Width*v.Height);
%%
%apply median filter
med=medfilt1(features);
dt=abs(features-med);
%%
%adaptive threhsolding and anchor frames
T = adaptthresh(dt, 0.5, 'Statistic', 'gaussian');
%T = adaptthresh(dt,0.5);
T = imbinarize(dt,T);

AnchorsM=find(T);
ModifiedSignature=diff(AnchorsM);

%%
%REPEAT - reading the ORIGINAL video file and extract features
v = VideoReader('../videos/tie.mp4');
features=[];
countframeO = 0;
while hasFrame(v)
    countframeO = countframeO + 1 ;
    img = readFrame(v); 
    img=0.2126 *img(:,:,1)+0.7152 *img(:,:,2)+0.0722*img(:,:,3);
    histimg=histcounts(img(:),32);
    cdf = cumsum(histimg)/sum(histimg);
    features=[features; cdf];  
end
whos video
%%
%get the differences
features=abs(diff(features));
features=sum(features,2)./(v.Width*v.Height);
%%
%apply median filter
med=medfilt1(features);
dt=abs(features-med);
%%
%adaptive threhsolding and anchor frames
T = adaptthresh(dt, 0.5, 'Statistic', 'gaussian');
% T = adaptthresh(dt,0.5);
T = imbinarize(dt,T);
AnchorsO=find(T);
OriginalSignature=diff(AnchorsO);

%%
%add one to each element in order to have our dollar$ = 1
OriginalSignature = OriginalSignature + 1;
ModifiedSignature = ModifiedSignature + 1;

dollar = zeros(1,1);
dollar(1,1) = 1;

% concatenate two signatures and transpose to get a vector
S = cat(1, OriginalSignature, dollar, ModifiedSignature)';

%%
% get suffix array, lcp and burrow-wheeler-transform
SA = getSuffixArray(S);
LCP = lcp(S, SA);
BWT = BWTint(S);

%%
% find matchs subsequences
s = size(S,2);

q = sum(findmatchSequences2(S,SA,LCP,BWT,1))

if (q > 20) %video may matched
    subsequences10 = sum(findmatchSequences2(S,SA,LCP,BWT,floor(0.10*s)));
    subsequences25 = sum(findmatchSequences2(S,SA,LCP,BWT,floor(0.25*s)));
    subsequences50 = sum(findmatchSequences2(S,SA,LCP,BWT,floor(0.50*s)));
    subsequences75 = sum(findmatchSequences2(S,SA,LCP,BWT,floor(0.75*s)));
    subsequences100 = sum(findmatchSequences2(S,SA,LCP,BWT,floor(1*s)-1));
end
