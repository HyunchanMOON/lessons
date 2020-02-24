clear; clc;
load('dailyHiTemps.mat')
Days = 1:365;
figure(1)
plot(Days, bosHi, 'b')
hold on
plot(Days, tokHi, 'r')
plot(Days, banHi, 'k')
xlim([1,365])
title('\bf{Daily High Temperature}')
xlabel('Day')
ylabel('Temperature(\circ F)')
legend('Boston', 'Tokyo', 'Bangalore', 'Location','southeast')
[~, a] = max(bosHi);
Bos = bosHi(217)
Bang = banHi(a)
Tok = tokHi(a)
