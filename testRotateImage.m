% Rotate image 1
RGB_im = imread('manor.png');

x0=400; %row
y0=400; %column
theta=125;
s=1.5;
RGB_R = RGB_im(:,:,1);
RGB_G = RGB_im(:,:,2);
RGB_B = RGB_im(:,:,3);
new_R = generateImage(RGB_R,x0,y0,theta,s);
new_G = generateImage(RGB_G,x0,y0,theta,s);
new_B = generateImage(RGB_B,x0,y0,theta,s);
newRGB = cat(3, new_R, new_G, new_B);

% visualization
figure
subplot(1,2,1)
imshow(RGB_im)
title('original manor')

subplot(1,2,2)
imshow(newRGB)
hold on
plot(y0*s,x0*s,'ro', 'LineWidth', 2, 'MarkerSize', 8)
title('rotated manor along (x0,y0) positioned at red circle')