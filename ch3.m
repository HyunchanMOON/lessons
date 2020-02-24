%% ������ �ҷ�����
load('FraGerKor.mat')

%% �׸���
plot(Year, France, 'o--', 'linewidth', 2)
hold on
plot(Year, Germany, ':x', 'linewidth', 2)
plot(Year, SouthKorea, '-hexagram', 'linewidth', 2)
hold off

%% �ٹ̱�
title('Gas Prices')
xlabel('Year')
ylabel('Price ($ Per Gallon)')

grid on

legend('France', 'Germany', 'Korea')