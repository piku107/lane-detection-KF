% This script generates artifical camera images with road lanes

addpath('sim');
%% parameters
fx = 600;
fy = 600;
cx = 640/2;
cy = 480/2;
K = [fx 0 cx;0 fy cy; 0 0 1];
R = rotx(60); 1%rotation matrix around x axis
t = - R * [0 -100 0]';
%% round trip street
r = 79;
% back straight
ang = [2*pi*ones(1,50)];
% first curve
xy = [[-79*ones(1,50);zeros(1,50);linspace(-600,0,50)]];    %to generate linearly spaced matix of interval 50 between -600 and 0 
xp=r*cos(0:0.11:pi);
yp=r*sin(0:0.11:pi);
xc = 0;
yc = 0;
ang = [ang 0:0.11:pi];
xy = [xy [-(xp+xc);zeros(1,length(xp));yp+yc]];
% straight
ang = [ang pi*ones(1,50)];
xy = [xy [79*ones(1,50);zeros(1,50);linspace(0,-600,50)]];
% bottom curve
xp=r*cos(pi:0.11:2*pi);
yp=r*sin(pi:0.11:2*pi);
xc = 0;
yc = -600;
ang = [ang pi:0.11:2*pi];
xy = [xy [-(xp+xc);zeros(1,length(xp));yp+yc]];

for i=1:length(xy)
    dt = xy(:,i);
    dr = R * inv(roty(rad2deg(ang(i))));
    image = genCameraImage(R, t, K, fx, fy, cx, cy, inv(roty(rad2deg(ang(i)))), dt, 1);
    imwrite(reshape(image,cy*2,cx*2),['sim/camera_image_' num2str(i) '.png']);
end