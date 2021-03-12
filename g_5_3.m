clc
clear

RGB = imread('img_g_5.png');
LEN = 31;
THETA = 11;
PSF = fspecial('motion',LEN,THETA); % create PSF
Blurred = imfilter(RGB,PSF,'circular','conv');
imshow(Blurred); 
title('Blurred Image');
