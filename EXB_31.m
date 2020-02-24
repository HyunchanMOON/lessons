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
% c = polyfit(T.Year, T.Population, 1) %1차 다항식으로 Fitting 하기, 1차 다항식 계수를 찾아준다.
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
c = polyfit(T.Year, T.Population, i) %1차 다항식으로 Fitting 하기, 1차 다항식 계수를 찾아준다.
xnew = 1950:2050;
ynew = polyval(c, xnew)
hold on
plot(xnew, ynew, '-')
legend('Data','degree1', 'degree2','degree3', 'degree4', 'degree5', 'Location', 'northwest')
xlabel('Year')
ylabel('Population[1000s]')
hold off
end