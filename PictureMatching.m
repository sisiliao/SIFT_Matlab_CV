clear

RGB_im = imread('manor_f1.png');
SIFTvect1 = generateSIFT(RGB_im);

RGB_im2 = imread('manor_f2.png');
SIFTvect2 = generateSIFT(RGB_im2);

normalized_sift1 = Normalize(SIFTvect1);
normalized_sift2 = Normalize(SIFTvect2);

[num_row_p1,~] = size(normalized_sift1);
[num_row_p2,~] = size(normalized_sift2);
bhatta_distance = zeros(num_row_p1,num_row_p2);
bhatta_distance_min = zeros(num_row_p1,1);
bhatta_distance_min_loc = zeros(num_row_p1,1);

for p1 = 1:num_row_p1 
    H1 = normalized_sift1(p1,4:39);
    for p2 = 1:num_row_p2
        H2 = normalized_sift2(p2,4:39);
        bhatta_distance(p1,p2) = bhattacharyya(H1,H2);
    end
end

for p1 = 1:num_row_p1 
    [bhatta_distance_min(p1),bhatta_distance_min_loc(p1)] = min(bhatta_distance(p1,:));
end

points1(:,1) = SIFTvect1(:,1) .* (2 .^ SIFTvect1(:,3));
points1(:,2) = SIFTvect1(:,2) .* (2 .^ SIFTvect1(:,3));
points2 = zeros(p1,2);


for p1 = 1:num_row_p1 
    ind_point2 = bhatta_distance_min_loc(p1);
    points2(p1,1) = SIFTvect2(ind_point2,1) .* (2 .^ SIFTvect2(ind_point2,3));
    points2(p1,2) = SIFTvect2(ind_point2,2) .* (2 .^ SIFTvect2(ind_point2,3)); 
end

% x=50
% showMatchedFeatures(RGB_im,RGB_im2,points1(x:x+10,:),points2(x:x+10,:),'montage','PlotOptions',{'go','ro','y-'})

showMatchedFeatures(RGB_im,RGB_im2,points1,points2,'montage','PlotOptions',{'go','ro','y-'})








