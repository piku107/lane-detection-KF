function [ BW ] = findLines( I )
%FINDLINES finds lines with hough transformation

hedge = vision.EdgeDetector;   %to separate bright objects from dark objects in an image
hhoughtrans = vision.HoughTransform(pi/360,'ThetaRhoOutputPort', true); % Used to detect lines in an image
hfindmax = vision.LocalMaximaFinder(10,	'HoughMatrixInput', true);  %to find the local maxima
hfindmax.NeighborhoodSize = [255 177];
hLocalMax.Threshold = 200;
hhoughlines = vision.HoughLines('SineComputation','Trigonometric function');    %the lines described by the rho and theta values 

% Find the edges in the intensity image
I2 = I;
BW = step(hedge, I2);

end

