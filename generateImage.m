function [scaled_im]=generateImage(im,x0,y0,theta,scale)
% x0=300;
% y0=900;
% RGB_im = imread('manor.png');
% grayim=rgb2gray(RGB_im);
% im = im2double(grayim);
% scale=2;
% % % % % % % % % % % % % % % % % % % % % 
[height,leng]=size(im);
center_x = int32(height/2);
center_y = int32(leng/2);

if x0 <= center_x && y0<=center_y
    % pad top or bottom
    pad_size_top = height-2*x0;
    newim = padarray(im,[pad_size_top 0],0,'pre');
    % pad left or right
    pad_size_left = leng-2*y0;
    newim = padarray(newim,[0 pad_size_left],0,'pre');
end
if x0 > center_x && y0>center_y
    pad_size_top = x0-(height-x0);
    newim = padarray(im,[pad_size_top 0],0,'post');
    pad_size_left = y0-(leng-y0);
    newim = padarray(newim,[0 pad_size_left],0,'post');
end
if x0 >= center_x && y0<=center_y
    pad_size_top = x0-(height-x0);
    newim = padarray(im,[pad_size_top 0],0,'post');
    pad_size_left = leng-2*y0;
    newim = padarray(newim,[0 pad_size_left],0,'pre');
end
if x0 <= center_x && y0>=center_y
    pad_size_top = height-2*x0;
    newim = padarray(im,[pad_size_top 0],0,'pre');
    pad_size_left = y0-(leng-y0);
    newim = padarray(newim,[0 pad_size_left],0,'post');
end

rotatedim = imrotate(newim,theta);
x_new = int32(floor(size(rotatedim,1) / 2 + 1));
y_new = int32(floor(size(rotatedim,2) / 2 + 1));

% crop rectangle [xmin ymin width height] 
cropped_im = imcrop(rotatedim,[y_new-y0 x_new-x0 leng height]);
scaled_im = imresize(cropped_im, scale);

