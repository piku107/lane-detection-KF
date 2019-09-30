function lane = laneExtraction( video )
%LANEEXTRACTION extracts lanes from image

if size(video,3)>1
    GreyImage = rgb2gray(video); %To convert a clored image to greyscale
else
    GreyImage = video;
end

threshold = graythresh(GreyImage);  %to convert high intensity image to binary image
SegImage = im2bw(GreyImage,threshold);  %to convert image to binary image by thresholding

bw=findLines(GreyImage); % to find lines in image

%  removing all object containing fewer than 90 pixels
bw1 = bwareaopen(bw,90); 

% remove noise
erodedI = SegImage;

% segmentation
L = bwlabel(erodedI>0,8); % to albel connected components in binary image
RGB = label2rgb(L); 

lane = polyFitting(L);
end

