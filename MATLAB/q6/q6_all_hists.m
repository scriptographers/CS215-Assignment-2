function [h1, h2, h] = q6_all_hists(T1, T2)
    % Given 2 images, this computes the individual histograms and the joint histogram of the 2 images.
    
    h1 = zeros(1, 26);
    h2 = zeros(1, 26);
    h  = zeros(26, 26);
    
    T1_unrolled = T1(:);
    T2_unrolled = T2(:);
    
    for i = 1:length(T1_unrolled)
        
        i1 = floor(T1_unrolled(i)/10)+1;
        i2 = floor(T2_unrolled(i)/10)+1;
        
        h1(i1)    = h1(i1)+1;
        h2(i2)    = h2(i2)+1;
        h(i1, i2) = h(i1, i2)+1;
        
    end
end