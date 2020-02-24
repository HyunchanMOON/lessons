%Chapter9
clear; clc;

img = imread('bluewhale.jpg');
%이미지 Data는 너비 x 높이 x 3(한 Pixel당 3개)

imshow(img);

img2 = img - 100; % 빛의 삼원색을 줄이는 과정
imshow(img2);

%gray scale 변환
gray = (uint32(img(:, :, 1)) + uint32(img2(:,:,2)) + uint32(img(:, :, 3)))/3
img(:, :, 1) = gray;
img(:, :, 2) = gray;
img(:, :, 3) = gray;
imshow(img)

% gray 값이 200이상이면 255; 흑백이미지로 이진화 시키기 
% gray 값이 200미만이면 0;
bin = gray;
bin(bin>= 200) = 255
bin(bin<200) = 0
img(:, :, 1) = bin;
img(:, :, 2) = bin;
img(:, :, 3) = bin;
imshow(img)

imwrite(img, 'mywhale.bmp')


%% audio file handling
clear; clc;

[au, freq] = audioread('bluewhale.au')
plot(au)
%sound(au*크기, freq*속도)
%sound(au + raasnd(79572,1)*0.3, freq) White Noise 추가

audiowrite('myWhale.flac', au, freq)

%% 
clear; clc;
%dlmread csv 파일 읽을 때 사용가능
% gp = dlmread('gasprices.csv', ',' , 5)
% xlsread, readmatrix 등 다양한 data 읽는 방법 존재.
% Year = gp(:, 1)

%% normalizing Data!!

clear; clc;

x = [2, 7, 8, NaN, 37, 44]

% 0~1사이로 : (x - min(x)) / (max(x) - min(x))
% 평균이 0, 표준편차 1 : (x - mean(x)) / std(x)

nX = (x - min(x)) / (max(x) - min(x))
nX1 = (x - mean(x)) / std(x)
mean(nX1)
std(nX1)
normalize(x)
% Y = normalize(x); %doc normalize
% plot(Y);
% A = magic(3)
% normalize(A)
% nX = (A-mean(A)) ./ std(A)


%NaN 찾아 무시하는 방법
x(~isnan(x)) 
%지우기
x(isnan(x)) = []
A = magic(3);
A(2,3) = NaN
%A(isnan(A)) = []; % => 행렬이 풀려버린다.

isnan(A)
%any(isnan(A)) % 하나라도 NaN이포함된
%A( :, any(isnan(A))) = [] 열날리기
%A(any(isnan(A),2) , :) = []

rmmissing(A) % 한번에 NaN 있는 row 날리기


%% interpolation(값이어주기)
clear; clc;
x = 0: 0.2 :15;
y = sin(x);
idx = randi([1, 76] , 30, 1)
y(idx) = NaN;
% 임의로 NaN 삽입.

plot(x,y, '-o')

y2 = fillmissing(y, 'spline', 'SamplePoints', x) % x값은 등간격이라고 가정함.
%spline, linear, nearest
hold on
plot(x,y2)
hold off

%% Moving Window operation
clear; clc;
x = [1, 4, 4, 2, 3, 5]
movmean(x, 3) %3칸씩 평균
movmean(x, [3, 0])

%% Correlation 상관관계

clear; clc;

load('FraGerKor.mat')
scatter(France, Germany)
%그래프를 수치적으로 나타낸것
%corrcoef(France, Germany)
% 1 : France 자신과의 상관관계, 4: Germany 자신과의 상관관계
% 나머지 France와 Germany의 상관관계 수치 1에 가까울 수록 상관관계가 크다.
corrcoef([France, SouthKorea, Germany])
%프랑스 한국 독일
plotmatrix([France, SouthKorea, Germany])

%% curve fitting
clear; clc;

x = [1, 3, 7];
y = [3, 7, 10];
plot(x, y, '*', 'MarkerSize', 12)

axis([0,8, 2, 11])

%fitting
c = polyfit(x, y, 1) %1차 다항식으로 Fitting 하기, 1차 다항식 계수를 찾아준다.
c2 = polyfit(x, y, 2)

xnew = 1:7;
ynew = polyval(c, xnew)
ynew2 = polyval(c2, xnew)

hold on

plot(xnew, ynew, '-')
plot(xnew, ynew2, '--')

hold off

%% curve fitting exercise
clear; clc;
load('FraGerKor.mat')

plot(France, SouthKorea, 'o')
c = polyfit(France, SouthKorea, 1)
c2 = polyfit(France, SouthKorea, 2)
xnew = 3:8;
ynew = polyval(c, xnew)
ynew2 = polyval(c2, xnew)
hold on
plot(xnew, ynew, '-')
plot(xnew, ynew2, '--')
hold off

% % a = 'my'
% % b = 'matlab'
% % c = [a,' ',b]
% a = 'my'
% b = 10
% %c = [a, b] % 숫자와 문자열 결합 안된다.
% num2str(b)
% c = [a, num2str(b)]

% eq = ['y = ' , num2str(c(1)), 'x ', num2str(c(2))]
eq = sprintf('y= %.2fx %.3f', c(1), c(2))
text(4,6, eq) %(n,m) n,m위치에 문자열 삽입


%% plot color
clear; clc;

%plot(1:10, 'color', [0.1, 0.75, 0.8], 'LineWidth', 5)
% plot(1:10, 'color', [119/255, 116/255, 245/255], 'LineWidth', 5)
% plot(1:10, 'color', [119/255, 116/255, 245/255], 'LineWidth', 5)

z = membrane;
surf(z)
colorbar
colormap(jet)
mycolormap = [0,0,1 ; 1,0,0;0,1,0]
colormap(mycolormap)

%%
h = gcf %figure속성 받아오기

%h.Children(Legend, axes, 정보)
%h.Children(2).Title('

%h.Children(1).Children(1).XData(1) = 10 속성 변경