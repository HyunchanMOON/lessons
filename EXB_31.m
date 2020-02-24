% %EX B_31
% clear; clc;
% T = readtable('population.xlsx')
% 
% T.Population(T.Population==0) = NaN
% plot(T.Year, T.Population)
% 
% T.Population = fillmissing(T.Population, 'spline')
% plot(T.Year, T.Population, 'o')
% 
% 
% c = polyfit(T.Year, T.Population, 1) %1�� ���׽����� Fitting �ϱ�, 1�� ���׽� ����� ã���ش�.
% c1 = polyfit(T.Year, T.Population, 2)
% 
% xnew = 1950:2050;
% ynew = polyval(c, xnew)
% ynew1 = polyval(c1, xnew)
% hold on
% plot(xnew, ynew, '-')
% plot(xnew, ynew1, '--')
% legend('Data','degree1', 'degree2', 'Location', 'northwest')
% xlabel('Year')
% ylabel('Population[1000s]')
% hold off

%EX B_31
clear; clc;
T = readtable('population.xlsx')

T.Population(T.Population==0) = NaN
plot(T.Year, T.Population)

T.Population = fillmissing(T.Population, 'spline')
plot(T.Year, T.Population, 'o')

for i = 1:5;
c = polyfit(T.Year, T.Population, i) %1�� ���׽����� Fitting �ϱ�, 1�� ���׽� ����� ã���ش�.
xnew = 1950:2050;
ynew = polyval(c, xnew)
hold on
plot(xnew, ynew, '-')
legend('Data','degree1', 'degree2','degree3', 'degree4', 'degree5', 'Location', 'northwest')
xlabel('Year')
ylabel('Population[1000s]')
hold off
end