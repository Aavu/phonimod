clc;
clear all;
x = wavread('/Users/administrator/Desktop/Matlab/piece.wav');
%x = x(1:2160001);
left = x;
right = x;
left(:,2) = [];
right(:,1) = [];
left = left(1:2160000);
right = right(1:2160000);
n = length(left)-1;
left = left-min(left);
left = left/max(left);
right = right-min(right);
right = right/max(right);
mix(:,:,2) = left;
mix(:,:,3) = right;
mix(:,:,1) = zeros;
y = reshape(mix,1080,2000,3);
imshow(y)
imwrite(y,'/Users/administrator/Desktop/piece.png','png','BitDepth',16);