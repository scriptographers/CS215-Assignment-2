clc;
clear;

PATH_1 = "img/T1.jpg";
PATH_2 = "img/T2.jpg";

% Reading
T1 = imread(PATH_1);
T2 = imread(PATH_2);

% Typecasting
T1 = double(T1);
T2 = double(T2);

tx_vals = -10:1:10;
r_vals = zeros(1, 21);
qmi_vals = zeros(1, 21);
for tx = tx_vals
    % Shift T2 along X by tx
    T2_shifted = imtranslate(T2, [tx 0], 'FillValues', 0);
    % Compute correlation coefficient:
    r_vals(tx+11) = corr2(T1, T2_shifted);
    % Compute QMI
    qmi_vals(tx+11) = q6_qmi(T1, T2_shifted);
end

% Correlation plot
figure
plot(tx_vals, r_vals, 'b');
xlabel("t_x");
ylabel("\rho");
title("Correlation coefficient (\rho) vs X-shift (t_x)");
saveas(gcf, "plots/correlation.jpg");

% QMI Plot
figure
plot(tx_vals, qmi_vals, 'b');
xlabel("t_x");
ylabel("QMI");
title("QMI vs X-shift (t_x)");
saveas(gcf, "plots/qmi.jpg");