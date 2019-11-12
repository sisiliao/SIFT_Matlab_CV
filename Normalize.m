function [new_vect]=Normalize(vect)
    [num_row,~] = size(vect(:,1));
    for r_ind=1:num_row
        thesum = sum(vect(r_ind,4:39));
        for histo_ind = 4:39
            new_vect(r_ind,histo_ind) = (vect(r_ind,histo_ind))/thesum;
        end
    end
end
        