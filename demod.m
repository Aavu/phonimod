fs = 48000;
y = imread('C:\Users\violinsimma\Desktop\Mod.png');
y = im2double(y);
[a,b,c] = size(y);
y1 = reshape(y,a*b,3);
y1(:,3) = [];
audiowrite('C:\Users\violinsimma\Desktop\piece.wav',y1,fs);
%sound(y1,fs)