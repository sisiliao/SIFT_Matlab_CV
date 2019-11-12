function [SIFTvector]=generateSIFT(RGB_im)

grayim=rgb2gray(RGB_im);
im = im2double(grayim);

[g0,g1,g2,g3,g4,g5,g6]=GaussianPyramid(im);
[l0,l1,l2,l3,l4,l5] = LaplacianPyramid(g0,g1,g2,g3,g4,g5,g6);

keypoint=FindExtrema(l0,l1,l2,l3,l4,l5,5);
%{
figure
imshow(RGB_im)
hold on
[len,wid]=size(keypoint);
for i=1:len
    if keypoint(i,3) == 1
        plot(keypoint(i,1)*keypoint(i,3)*2,keypoint(i,2)*keypoint(i,3)*2,  'bo', 'LineWidth', 2, 'MarkerSize', 8);
    end
    if keypoint(i,3) == 2
        plot(keypoint(i,1)*4,keypoint(i,2)*4,  'go', 'LineWidth', 2, 'MarkerSize', 16);
    end
    if keypoint(i,3) == 3
        plot(keypoint(i,1)*8,keypoint(i,2)*8,  'yo', 'LineWidth', 2, 'MarkerSize', 32);
    end
    if keypoint(i,3) == 4
        plot(keypoint(i,1)*16,keypoint(i,2)*16,  'mo', 'LineWidth', 2, 'MarkerSize', 64);
    end    
    hold on
end
pause(2)
%}

[arr_mag,arr_dir,arr_weighted]=FindGradient(keypoint,g1,g2,g3,g4);

% visualize gradient,magnitude
% VisualizeGradient(keypoint,arr_dir,arr_mag,arr_weighted,g1,g2,g3,g4)

for ind=1:size(arr_dir,3)
    v = arr_dir(:,:,ind);
    w = arr_weighted(:,:,ind);
    arr_histogram(:,ind)=FindHistogram(36,v(:),w(:));
end

% Find peak and add to new histogram
for ind_histogram =1:size(arr_dir,3)
    vect = arr_histogram(:,ind_histogram);
    [Peak,indPeak] = max(vect);  %Find peak
%     sub1 = flip(vect(1:indPeak));
%     sub2 = flip(vect(indPeak+1:36));
    sub1 = vect(indPeak:36);
    sub2 = vect(1:indPeak-1);
    newVect = [sub1;sub2];
    arr_histogram2(:,ind_histogram) = newVect;
end

% visualize Histogram and peak
%{
figure
subplot(1,3,1)
plot(1:36,arr_histogram(:,5));
title('Find Peak')
hold on 
findpeaks(arr_histogram(:,5),'SortStr','descend','NPeaks',1)
subplot(1,3,2)
bar(1:36,arr_histogram(:,5))
title('Original Histogram')
pause(1)
subplot(1,3,3)
bar(1:36,arr_histogram2(:,5))
title('Rotation Invariant Histogram')
pause(2)
%}

transposed_histo = transpose(arr_histogram2);
disp(size(transposed_histo))
disp(size(keypoint))
SIFTvector = [keypoint,transposed_histo];

end