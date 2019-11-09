function [arr_mag,arr_dir,arr_weighted]=FindGradient(key,g1,g2,g3,g4)

[Gmag1, Gdir1] = imgradient(g1,'prewitt');
[Gmag2, Gdir2] = imgradient(g2,'prewitt');
[Gmag3, Gdir3] = imgradient(g3,'prewitt');
[Gmag4, Gdir4] = imgradient(g4,'prewitt');

% arr_mag = zeros(16,16);
% arr_dir = zeros(16,16);

for i=1:size(key,1)
    try
        if key(i,3)==1
            arr_mag(:,:,i) = Gmag1(key(i,1)-7:key(i,1)+8,key(i,2)-7:key(i,2)+8);
            arr_dir(:,:,i) = Gdir1(key(i,1)-7:key(i,1)+8,key(i,2)-7:key(i,2)+8);
        end
        if key(i,3)==2
            arr_mag(:,:,i) = Gmag2(key(i,1)-7:key(i,1)+8,key(i,2)-7:key(i,2)+8);
            arr_dir(:,:,i) = Gdir2(key(i,1)-7:key(i,1)+8,key(i,2)-7:key(i,2)+8);
        end
        if key(i,3)==3
            arr_mag(:,:,i) = Gmag3(key(i,1)-7:key(i,1)+8,key(i,2)-7:key(i,2)+8);
            arr_dir(:,:,i) = Gdir3(key(i,1)-7:key(i,1)+8,key(i,2)-7:key(i,2)+8);
        end
        if key(i,3)==4
            arr_mag(:,:,i) = Gmag4(key(i,1)-7:key(i,1)+8,key(i,2)-7:key(i,2)+8);
            arr_dir(:,:,i) = Gdir4(key(i,1)-7:key(i,1)+8,key(i,2)-7:key(i,2)+8);
        end
        arr_weighted(:,:,i) = arr_mag(:,:,i) .* fspecial('gaussian',16,1);
    catch
        disp("")
    end    
end

% figure
% imshowpair(Gmag1, Gdir1, 'montage');
