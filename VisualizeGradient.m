function []=VisualizeGradient(keypoint,arr_dir,arr_mag,arr_weighted,g1,g2,g3,g4)
    num=202;
    figure
    imshow(g4(keypoint(num,1)-7:keypoint(num,1)+8,keypoint(num,2)-7:keypoint(num,2)+8),[])
    [delta_x, delta_y] = pol2cart(deg2rad(arr_dir(:,:,num)),arr_mag(:,:,num));
    truesize([256,256])
    hold on
    pause(2)
    quiver(1:16,1:16,delta_x,delta_y)
    title("Gradient orientation")
    pause(2)
    
    figure
    imshow(arr_mag(:,:,num))
    truesize([256,256])
    title("Gradient magnitude")
    pause(2)
    
    figure
    imshow(arr_weighted(:,:,num),[min(arr_weighted(:)) 0.1])
    truesize([256,256])
    title("Gaussian weighted Gradient magnitude")

    