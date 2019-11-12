function d=bhattacharyya(H1,H2)
    sqrt_multiply = sqrt(H1 .* H2);
    sum_sqrt_multiply = sum(sqrt_multiply(:));
    d=sqrt(1-sum_sqrt_multiply);
end

