% This script transforms the camera images into bird view

addpath('sim');
fx = 600;
fy = 600;
cx = 640/2;
cy = 480/2;
K = [fx 0 cx;0 fy cy; 0 0 1];
R_b = rotx(30);
for i=1:158
    I = imread(['sim/camera_image_' num2str(i) '.png']); %read camera image
    K2 = [fx 0 cx*4;0 fy cy*4;0 0 1];
    bird_view = getBirdViewImage(fx, fy, cx, cy, I, K, R_b, K2, cy*4, cx*4,[0;0;0]);
    SE = strel('square',4);
    dilateI = imdilate(reshape(bird_view,cy*8,cx*8),SE);
    imwrite(dilateI,['sim/bird_view_' num2str(i) '.png']);  %write the images in a specified folder
end