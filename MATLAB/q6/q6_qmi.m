function [qmi] = q6_qmi(T1, T2)
    [h1, h2, h] = q6_all_hists(T1, T2);
    % Normalizing everything:
    h1_norm = h1/sum(h1, 'all');
    h2_norm = h2/sum(h2, 'all');
    h_norm  = h/sum(h, 'all');
    qmi = sum((h_norm - transpose(h1_norm)*h2_norm).^2, 'all');
    end