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
E = rand(4); %0~n ���� ���� ����
F = randi([0,10], [2,3]); %[n,m], [o,p] n~m���� oxp���
G = magic(3);%������ ���

%% matrix indexing
% ������(���ε���, ���ε���)
clear; clc;
A = magic(3);

x = A(2,3);
x = A(3,1);
A(3,2) = 10;

y = A(1, [2,3] ); y = A(1, 2:3);
y = A(1, [1, 1, 3]);
y = A(1, 1:end);

y = A(1:2, 3);
y = A( : , 2); %�� ��ü�� �̴� indexing

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
%column ����
m = mean(A); % ���������� ����� ��������.
s = sum(A);
%row ����
s = sum(A, 2); % dim 1: ������, 2: �����
m = mean(A, 2);
% ��ü
%s = sum(A, 'all')
%m = mean(A, 'all')

M = [1:4 ; 5:8 ; 9:12];
N = reshape(M, 4, 3); % Matrix Size ����

%% Cell Array
clear; clc;

a = 'MATLAB';
b = 'Simulink';

c = [a , b];
c = {a ; b}; %Cell �迭

% cell type indexing
x = c(1,1); %ccell type ��ȯ
y = c{1,1}; %data ��ȯ
c{2} = 'SIMULINK'; % �⺻������ �߰�ȣ Indexing ���

% M = zeros(2,2);
% N = ones(3,3);
% x = int32(10)
% C= {M,N,x} 
% ctrl + r ��ü �ּ�, ctrl + t �ּ�����

x = 1:5;
y = randi([1 , 10], 1, 5);
bar(x, y)

xticklabels( { 'Jan', 'Feb', 'Mar', 'Apr', 'May'}) %
xticks([0.5, 2, 3.5, 4, 5])% ���� ����

%% �׷��� ���� �׸��� ��� 3����
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