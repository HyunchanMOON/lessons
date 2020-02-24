%Chapter 5

%% Matrix 
clear; clc;
A = [1,2 ; 3,4];
b = [5, 6];
B = [A , b']; B = [A , [5;6]];

A = zeros(2,3);
B = zeros(4);
c = ones(3,2);
D = eye(5);
E = rand(4); %0~n 사이 난수 생성
F = randi([0,10], [2,3]); %[n,m], [o,p] n~m까지 oxp행렬
G = magic(3);%마방진 행렬

%% matrix indexing
% 변수명(행인덱스, 열인덱스)
clear; clc;
A = magic(3);

x = A(2,3);
x = A(3,1);
A(3,2) = 10;

y = A(1, [2,3] ); y = A(1, 2:3);
y = A(1, [1, 1, 3]);
y = A(1, 1:end);

y = A(1:2, 3);
y = A( : , 2); %열 전체를 뽑는 indexing

z = A([1,3], [2,3]);

B = A(end:-1:1, :)

%% Matrix Operation
clear; clc;
A = [1,2 ; 3,4];
B = [5,6 ; 7,8];

x = A+1;
x = A-1;
x = A*2;
x = A/2;
x = A + B;
x = A - B;
x = A .*B;
x = A ./B;
y = A*B;
y = A/B; %A/B = A * B-1, A\B = A-1*B
z = A*inv(B);

%%
clear;clc;
A = [3,2,6 ; 7,8,1; 0,2,4]
%column 방향
m = mean(A); % 열방향으로 평균이 구해진다.
s = sum(A);
%row 방향
s = sum(A, 2); % dim 1: 열방향, 2: 행방향
m = mean(A, 2);
% 전체
%s = sum(A, 'all')
%m = mean(A, 'all')

M = [1:4 ; 5:8 ; 9:12];
N = reshape(M, 4, 3); % Matrix Size 변경

%% Cell Array
clear; clc;

a = 'MATLAB';
b = 'Simulink';

c = [a , b];
c = {a ; b}; %Cell 배열

% cell type indexing
x = c(1,1); %ccell type 반환
y = c{1,1}; %data 반환
c{2} = 'SIMULINK'; % 기본적으로 중괄호 Indexing 사용

% M = zeros(2,2);
% N = ones(3,3);
% x = int32(10)
% C= {M,N,x} 
% ctrl + r 전체 주석, ctrl + t 주석해제

x = 1:5;
y = randi([1 , 10], 1, 5);
bar(x, y)

xticklabels( { 'Jan', 'Feb', 'Mar', 'Apr', 'May'}) %
xticks([0.5, 2, 3.5, 4, 5])% 간격 설정

%% 그래프 겹쳐 그리는 방법 3가지
clear; clc; close all;
load('FGK.mat')

%1. hold on/off
%plot(Year, France);
hold on
%plot(Year, Germany);
%plot(Year, SouthKorea);
hold off

%2. plot(x,y , x,y, x,y, .....)
% figure(2)
%plot(Year, France,'--*', Year, Germany, ':.', Year, SouthKorea, '.-');

% 3. plot(x, [y1, y2, y3])
% figure(3)
FGK = [France, Germany, SouthKorea];
%plot(Year, FGK);


%% 3-D Plot
close all;

A = [1,2 ; 3,4]
%surf(A)

z = membrane;
% surf(z)
% x = 0:0.2:2*pi;
% y = sin(x);
% z = cos(x);
% plot3(x, y ,z)

surf(z)
shading interp
% mesh(z)
% contour(z)
% contour3(z)