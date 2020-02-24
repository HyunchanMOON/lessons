%Chapter9
clear; clc;

img = imread('bluewhale.jpg');
%�̹��� Data�� �ʺ� x ���� x 3(�� Pixel�� 3��)

imshow(img);

img2 = img - 100; % ���� ������� ���̴� ����
imshow(img2);

%gray scale ��ȯ
gray = (uint32(img(:, :, 1)) + uint32(img2(:,:,2)) + uint32(img(:, :, 3)))/3
img(:, :, 1) = gray;
img(:, :, 2) = gray;
img(:, :, 3) = gray;
imshow(img)

% gray ���� 200�̻��̸� 255; ����̹����� ����ȭ ��Ű�� 
% gray ���� 200�̸��̸� 0;
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
%sound(au*ũ��, freq*�ӵ�)
%sound(au + raasnd(79572,1)*0.3, freq) White Noise �߰�

audiowrite('myWhale.flac', au, freq)

%% 
clear; clc;
%dlmread csv ���� ���� �� ��밡��
% gp = dlmread('gasprices.csv', ',' , 5)
% xlsread, readmatrix �� �پ��� data �д� ��� ����.
% Year = gp(:, 1)

%% normalizing Data!!

clear; clc;

x = [2, 7, 8, NaN, 37, 44]

% 0~1���̷� : (x - min(x)) / (max(x) - min(x))
% ����� 0, ǥ������ 1 : (x - mean(x)) / std(x)

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


%NaN ã�� �����ϴ� ���
x(~isnan(x)) 
%�����
x(isnan(x)) = []
A = magic(3);
A(2,3) = NaN
%A(isnan(A)) = []; % => ����� Ǯ��������.

isnan(A)
%any(isnan(A)) % �ϳ��� NaN�����Ե�
%A( :, any(isnan(A))) = [] ��������
%A(any(isnan(A),2) , :) = []

rmmissing(A) % �ѹ��� NaN �ִ� row ������


%% interpolation(���̾��ֱ�)
clear; clc;
x = 0: 0.2 :15;
y = sin(x);
idx = randi([1, 76] , 30, 1)
y(idx) = NaN;
% ���Ƿ� NaN ����.

plot(x,y, '-o')

y2 = fillmissing(y, 'spline', 'SamplePoints', x) % x���� ����̶�� ������.
%spline, linear, nearest
hold on
plot(x,y2)
hold off

%% Moving Window operation
clear; clc;
x = [1, 4, 4, 2, 3, 5]
movmean(x, 3) %3ĭ�� ���
movmean(x, [3, 0])

%% Correlation �������

clear; clc;

load('FraGerKor.mat')
scatter(France, Germany)
%�׷����� ��ġ������ ��Ÿ����
%corrcoef(France, Germany)
% 1 : France �ڽŰ��� �������, 4: Germany �ڽŰ��� �������
% ������ France�� Germany�� ������� ��ġ 1�� ����� ���� ������谡 ũ��.
corrcoef([France, SouthKorea, Germany])
%������ �ѱ� ����
plotmatrix([France, SouthKorea, Germany])

%% curve fitting
clear; clc;

x = [1, 3, 7];
y = [3, 7, 10];
plot(x, y, '*', 'MarkerSize', 12)

axis([0,8, 2, 11])

%fitting
c = polyfit(x, y, 1) %1�� ���׽����� Fitting �ϱ�, 1�� ���׽� ����� ã���ش�.
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
% %c = [a, b] % ���ڿ� ���ڿ� ���� �ȵȴ�.
% num2str(b)
% c = [a, num2str(b)]

% eq = ['y = ' , num2str(c(1)), 'x ', num2str(c(2))]
eq = sprintf('y= %.2fx %.3f', c(1), c(2))
text(4,6, eq) %(n,m) n,m��ġ�� ���ڿ� ����


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
h = gcf %figure�Ӽ� �޾ƿ���

%h.Children(Legend, axes, ����)
%h.Children(2).Title('

%h.Children(1).Children(1).XData(1) = 10 �Ӽ� ����