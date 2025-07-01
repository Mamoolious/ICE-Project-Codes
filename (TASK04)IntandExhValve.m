clc; clear;

theta = linspace(-200, 200, 1000);    % زاویه میل‌لنگ (درجه)
Lmax_in = 0.0085 ;    % ماکزیمم بازشدگی ورودی (متر)
Lmax_ex = 0.007;    % ماکزیمم بازشدگی خروجی (متر)

% پارامترهای باز و بسته شدن سوپاپ‌ها
intake_open = 0;      % شروع بازشدگی ورودی (درجه)
intake_close = 190;   % پایان بازشدگی ورودی
exhaust_open = -180;  % شروع بازشدگی خروجی (درجه)
exhaust_close = -10;  % پایان بازشدگی خروجی

% مقداردهی اولیه
L_intake = zeros(size(theta));
L_exhaust = zeros(size(theta));

% پروفایل سینوسی bell-shape کامل و نرم برای intake
idx_in = (theta >= intake_open) & (theta <= intake_close);
ttheta_in = (theta(idx_in) - intake_open) / (intake_close - intake_open); % نرمال‌سازی
L_intake(idx_in) = Lmax_in * sin(pi * ttheta_in);

% پروفایل سینوسی bell-shape کامل و نرم برای exhaust
idx_ex = (theta >= exhaust_open) & (theta <= exhaust_close);
ttheta_ex = (theta(idx_ex) - exhaust_open) / (exhaust_close - exhaust_open); % نرمال‌سازی
L_exhaust(idx_ex) = Lmax_ex * sin(pi * ttheta_ex);

figure;
plot(theta, L_exhaust*1000, 'r', 'LineWidth',2); hold on;
plot(theta, L_intake*1000, 'b', 'LineWidth',2);
xline(0,'k--','TDC','LabelVerticalAlignment','bottom','LabelHorizontalAlignment','center','LineWidth',1.2);
xlabel('Crank angle (deg)');
ylabel('Valve lift (mm)');
title('Perfect Bell-shape Valve Lift Profile');
legend('Exhaust valve','Intake valve','TDC','Location','northwest');
grid on;
clc; clear;

theta = linspace(-200, 200, 1000);    % زاویه میل‌لنگ (درجه)
Lmax_in = 0.008;    % ماکزیمم بازشدگی ورودی (متر)
Lmax_ex = 0.007;    % ماکزیمم بازشدگی خروجی (متر)

% پارامترهای باز و بسته شدن سوپاپ‌ها
intake_open = 0;      % شروع بازشدگی ورودی (درجه)
intake_close = 190;   % پایان بازشدگی ورودی
exhaust_open = -180;  % شروع بازشدگی خروجی (درجه)
exhaust_close = -10;  % پایان بازشدگی خروجی

% زاویه عطف
intake_peak = (intake_open + intake_close)/2;
exhaust_peak = (exhaust_open + exhaust_close)/2;

% مقداردهی اولیه
L_intake = zeros(size(theta));
L_exhaust = zeros(size(theta));

% پروفایل سینوسی bell-shape کامل و نرم برای intake
idx_in = (theta >= intake_open) & (theta <= intake_close);
ttheta_in = (theta(idx_in) - intake_open) / (intake_close - intake_open); % نرمال‌سازی
L_intake(idx_in) = Lmax_in * sin(pi * ttheta_in);

% پروفایل سینوسی bell-shape کامل و نرم برای exhaust
idx_ex = (theta >= exhaust_open) & (theta <= exhaust_close);
ttheta_ex = (theta(idx_ex) - exhaust_open) / (exhaust_close - exhaust_open); % نرمال‌سازی
L_exhaust(idx_ex) = Lmax_ex * sin(pi * ttheta_ex);

figure;
plot(theta, L_exhaust*1000, 'r', 'LineWidth',2); hold on;
plot(theta, L_intake*1000, 'b', 'LineWidth',2);

% نمایش TDC
xline(0,'k--','TDC','LabelVerticalAlignment','bottom','LabelHorizontalAlignment','center','LineWidth',1.2);

% نشانه‌گذاری زاویه عطف هر سوپاپ
plot(intake_peak, Lmax_in*1000, 'bo', 'MarkerFaceColor','b','MarkerSize',7)
text(intake_peak, Lmax_in*1000+0.4, sprintf('Intake Peak (%.1f°, %.1f mm)', intake_peak, Lmax_in*1000), ...
    'HorizontalAlignment','center','Color','b','FontWeight','bold')

plot(exhaust_peak, Lmax_ex*1000, 'ro', 'MarkerFaceColor','r','MarkerSize',7)
text(exhaust_peak, Lmax_ex*1000+0.4, sprintf('Exhaust Peak (%.1f°, %.1f mm)', exhaust_peak, Lmax_ex*1000), ...
    'HorizontalAlignment','center','Color','r','FontWeight','bold')

xlabel('Crank angle (deg)');
ylabel('Valve lift (mm)');
title('Perfect Bell-shape Valve Lift Profile (Peaks Highlighted)');
legend('Exhaust valve','Intake valve','TDC','Location','northwest');
grid on;
