clear; clc;
load('natickData.mat')

plot(Times, TempData)
xlim([0, 23])
title('\bf{Natick Hourly Temperatures}')
xlabel('Hour')
ylabel('Temperature[¨¬F]')
legend(Months, 'location', 'eastoutside')
m = mean(TempData)
s = std(TempData);
[~, i] = max(s)
r = min(TempData);
R = max(TempData);
range = R - r
mr = max(range)
[~, j] = max(range)