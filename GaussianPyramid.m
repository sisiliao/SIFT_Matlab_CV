function [g0,g1,g2,g3,g4,g5,g6]=GaussianPyramid(im)
% level 0
g0_gau = fspecial('gaussian',11,1);
g0 = imresize(conv2(im,g0_gau,'same'),1);

% level 1
g1_gau = fspecial('gaussian',11,2);
g1 = imresize(conv2(g0,g1_gau,'same'),0.5);

% level 2
g2_gau = fspecial('gaussian',11,4);
g2 = imresize(conv2(g1,g2_gau,'same'),0.5);

% level 3
g3_gau = fspecial('gaussian',11,8);
g3 = imresize(conv2(g2,g3_gau,'same'),0.5);

% level 4
g4_gau = fspecial('gaussian',11,16);
g4 = imresize(conv2(g3,g4_gau,'same'),0.5);

% level 5
g5_gau = fspecial('gaussian',11,32);
g5 = imresize(conv2(g4,g5_gau,'same'),0.5);

% level 6
g6_gau = fspecial('gaussian',11,64);
g6 = imresize(conv2(g5,g6_gau,'same'),0.5);