function [k]=FindExtrema(l0,l1,l2,l3,l4,l5,neighbor)

up_l1 = imresize(l1,2);
up_l2 = imresize(l2,2);
up_l3 = imresize(l3,2);
up_l4 = imresize(l4,2);
up_l5 = imresize(l5,2);

down_l0 = imresize(l0,0.5);
down_l1 = imresize(l1,0.5);
down_l2 = imresize(l2,0.5);
down_l3 = imresize(l3,0.5);
down_l4 = imresize(l4,0.5);

k = [0,0,0];
dis = (neighbor-1)/2;

[len1,wid1]=size(l1);
% l1
for i=4:len1-neighbor
    for j=4:wid1-neighbor
        if l1(i,j) == max(max(l1(i-dis:i+dis,j-dis:j+dis))) || l1(i,j) == min(min(l1(i-dis:i+dis,j-dis:j+dis))) 
            if (l1(i,j) > max(max(down_l0(i-dis:i+dis,j-dis:j+dis))) && l1(i,j) > max(max(up_l2(i-dis:i+dis,j-dis:j+dis)))) || (l1(i,j) < min(min(up_l2(i-dis:i+dis,j-dis:j+dis))) && l1(i,j) < min(min(down_l0(i-dis:i+dis,j-dis:j+dis)))) 
                if abs(l1(i,j)) > 0.2
                    b=[j,i,1]
                    k=[k;b]
                end
            end
        end
    end
end

% l2
[len2,wid2]=size(l2);
for i=4:len2-4
    for j=4:wid2-4
        if l2(i,j) == max(max(l2(i-dis:i+dis,j-dis:j+dis))) || l2(i,j) == min(min(l2(i-dis:i+dis,j-dis:j+dis))) 
            if (l2(i,j) > max(max(down_l1(i-dis:i+dis,j-dis:j+dis))) && l2(i,j) > max(max(up_l3(i-dis:i+dis,j-dis:j+dis)))) || (l2(i,j) < min(min(up_l3(i-dis:i+dis,j-dis:j+dis))) && l2(i,j) < min(min(down_l1(i-dis:i+dis,j-dis:j+dis)))) 
                if abs(l2(i,j)) > 0.16
                    b=[j,i,2]
                    k=[k;b]
                end
            end
        end
    end
end

% l3
[len3,wid3]=size(l3);
for i=5:len3-5
    for j=5:wid3-5
        if l3(i,j) == max(max(l3(i-dis:i+dis,j-dis:j+dis))) || l3(i,j) == min(min(l3(i-dis:i+dis,j-dis:j+dis))) 
            if (l3(i,j) > max(max(down_l2(i-dis:i+dis,j-dis:j+dis))) && l3(i,j) > max(max(up_l4(i-dis:i+dis,j-dis:j+dis)))) || (l3(i,j) < min(min(up_l4(i-dis:i+dis,j-dis:j+dis))) && l3(i,j) < min(min(down_l2(i-dis:i+dis,j-dis:j+dis)))) 
                if abs(l3(i,j)) > 0.08
                    b=[j,i,3]
                    k=[k;b]
                end
            end
        end
    end
end

% l4
[len4,wid4]=size(l4);
for i=5:len4-5
    for j=5:wid4-5
        if l4(i,j) == max(max(l4(i-dis:i+dis,j-dis:j+dis))) || l4(i,j) == min(min(l4(i-dis:i+dis,j-dis:j+dis))) 
            if (l4(i,j) > max(max(down_l3(i-dis:i+dis,j-dis:j+dis))) && l4(i,j) > max(max(up_l5(i-dis:i+dis,j-dis:j+dis)))) || (l4(i,j) < min(min(up_l5(i-dis:i+dis,j-dis:j+dis))) && l4(i,j) < min(min(down_l3(i-dis:i+dis,j-dis:j+dis)))) 
                if abs(l4(i,j)) > 0.06
                    b=[j,i,4]
                    k=[k;b]
                end
            end
        end
    end
end

% l5
[len5,wid5]=size(l5);
for i=5:len5-5
    for j=5:wid5-5
        if l5(i,j) == max(max(l5(i-dis:i+dis,j-dis:j+dis))) || l5(i,j) == min(min(l5(i-dis:i+dis,j-dis:j+dis))) 
            if (l5(i,j) > max(max(down_l4(i-dis:i+dis,j-dis:j+dis)))) || (l5(i,j) < min(min(down_l4(i-dis:i+dis,j-dis:j+dis))))
                if abs(l5(i,j)) > 0
                    b=[j,i,5];
%                     k=[k;b];
                end
            end
        end
    end
end
k=k(2:size(k,1),:);

