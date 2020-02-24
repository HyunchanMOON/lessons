%% 데이터 불러오기
load('FraGerKor.mat')

%% 그리기
plot(Year, France, 'o--', 'linewidth', 2)
hold on
plot(Year, Germany, ':x', 'linewidth', 2)
plot(Year, SouthKorea, '-hexagram', 'linewidth', 2)
hold off

%% 꾸미기
title('Gas Prices')
xlabel('Year')
ylabel('Price ($ Per Gallon)')

grid on

legend('France', 'Germany', 'Korea')