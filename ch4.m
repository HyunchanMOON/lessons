%chaper4

%% Vector & Matrix 
clear;
clc;
v1 = [1, 2, 3]; % recommend
v2 = [1 2 3];
v3 = [1; 2; 3;];
M = [1, 2 ; 3, 4];

%1~100
vEq = linspace(0, 100, 11);
vEq2 = 0:2:9;
vEq3 = 10:-2:1;
vEq4 = 1:10;

%transpaose
Tr = vEq';
Tr2 = linspace(0, 10, 3)';
Tr3 = (1:5)';

c = [1 + 2i, 1-2i]
cTr = c.'

%% vector 연산
clear; clc;

v= [1, 2, 3];
x = v+3;
x = v-3;
x = v*3;
x = v/3;
v2 = 4:6;
y = v+v2;
y = v-v2;
y = v.*v2;
y = v./v2;

%% statistical functions
clear; clc;
x = [2, 5, 9, 1 10];
m = mean(x); %평균
m = min(x);
m = max(x);
s = sum(x)
v = var(x); %분산
s = std(x); %표준편차
[m, i] = min(x);
[m, i] = max(x);
[~, i] = max(x);

%% indexing
% 여러 데이터중 특정데이터에 접근하기 위해 사용
%reference/assign
% 1. Linear Indexing : 변수명(인덱스)
% 2. Row-Column Indexing : 변수명(행 인덱스, 열인덱스)
% 3. Logical Indexing : 변수명(조건)
clear; clc;
x = [5, 4, 10, 2];

y = x(2) + x(3);
x(3) = 11;

y = x( [1,1,1]);

y = x([4,3,2,1]);

y = x(end -2)
y = x(end:-1:1)
x([1,2]) = 0;
x([1,2]) = [3,7];

% y = x(end + 1)
x(end + 1) = 7;
x(end +3) = 5;
x(end) = [];

%%
clear;clc;
load('FraGerkor.mat')
plot(Year,France)
% 프랑스의 가스 가격이 최소인 연도는?
[~, i] = min(France(:,1))
Year(i)

%% Plot Functions
clear;clc;

x = 0:0.5:4*pi;
y = sin(x);
plot(x,y)
figure(3)
subplot(2, 2, 1)
area(x,y)
title('subplot1')

subplot(2,2,2)
bar(x,y)
title('subplot2')

subplot(2,2, [3,4])
stairs(x,y)
%sgtitle('Super Title') ~ ver.2018b

figure(1)
stem(x,y)

figure(1)

%axis([0, 15, -1.5, 1.5])
axis('equal')

% xlim([0,13]);
% ylim([-1,1]);