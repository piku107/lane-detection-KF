function [w,lambda] = raytracing(R,t,uv,K,fx,fy,cx,cy)
%RAYTRACING generates world point coordinate from image point

c = [(uv(1,1)-cx)/fx;(uv(1,2)-cy)/fy;1];
lambda = ( (- R(3,1) * R(:,1)' - R(3,3) * R(:,3)')*t + t(3) ) / (1 - R(3,1) * R(:,1)' * c - R(3,3) * R(:,3)' * c);
w =  inv(R) * ( inv(K) * lambda * [uv(1,:)';1] - t);
end

