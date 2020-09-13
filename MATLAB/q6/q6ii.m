clc;
clear;

PATH = "img/T1.jpg";

% Reading
T1 = imread(PATH);
T2 = 255 - T1; % Negative

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
plot(tx_vals, r_vals, 'r');
xlabel("t_x");
ylabel("\rho");
title("Correlation coefficient (\rho) vs X-shift (t_x)");
saveas(gcf, "plots/correlation_negative.jpg");

% QMI Plot
figure
plot(tx_vals, qmi_vals, 'r');
xlabel("t_x");
ylabel("QMI");
title("QMI vs X-shift (t_x)");
saveas(gcf, "plots/qmi_negative.jpg");