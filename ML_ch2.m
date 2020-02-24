%% Machine Learing Chapter2 Matlab Review.
clear; clc;

A = [178 73 ; 169 52];
T = array2table(A);
T = array2table(A, 'variablenames', {'height','weight'}, 'rownames', {'student1', 'student2'});
T2 = readtable('bball_stats.xlsx');
T3 = readtable('bball_stats.xlsx','readrownames', true);

data{1,'Age'};
data(1,'Age');
data(1, {'Sex', 'Age'})
data{1, {'Sex', 'Age'}} %�߰�ȣ�� ���� Data Type �� ���� ����!

isequaln(data{:,3},data.Age) %���� ����̴�. isequaln -> ������ 1, �ٸ��� 0

T.Properties %Properties Table �Ӽ� Ȯ���ϴ� �Լ�
T.Properties.VariableUnits = {'cm', 'kg'} % �Ӽ��� �������� �߰�
A = magic(2)
I = [false true ; true false]
I = A>2

I = data.BPSyst1 > 130;


A = [1 2 1 2 1 1 2]
C = categorical(A) % ������


S = data.Sex;
H = data.Height;
W = data.Weight;
scatter(H,W)
xlabel('Height')
gscatter(H, W, S) % ��� �׷쿡 data���� �ľ��ϰ� ���ִ� �Լ� gscatter

mean(H)
m = grpstats(H, S) %�� ī�װ��� ���
A = magic(3)
A(2,3) = nan
nanmean(A) % nan�� ������ ���

A(any(isnan(A),2), :) = [] %nan�� ���Ե� ���� �����°�
rmmissing(A)% nan�� ���Ե� ���� ������.


%% data ��ó��

HW = data{:, [8 9]}; % �� ���� ������ �ٸ���.

zscore % => data - ��� / ǥ������

mynomalize % => data - �ּҰ� / �ִ� - �ּ�