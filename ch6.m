% Chapter 6
clear; clc;
%T = readtable('EPLresults.xlsx', 'ReadRowNames', true)
% T(1,1)
% T('Arsenal', 'AwayWins')
T = readtable('EPLresults.xlsx')

%indexing
% () ����ϸ� table type�� ��ȯ
% {} ����ϸ� ������ ��ȯ
x = T(1,2)
x = T(1, 'HomeWins')
%T(1,2) = {15}, T{1,2} = 15
%T.HomeWins : HomeWins 1�� 

T2 = sortrows(T, 'HomeWins', 'descend');

% indexing ����
% ����� ��� �¸����� ���� ���� 3�� ���� �̸�

T3 = sortrows(T, 'AwayWins', 'descend');
X = T3(1:3, 'Team');

% ����� ��� �¸����� ���� ���� 3�� ���� �̸��� Ȩ��� �¸���

X1 = T3(end:-1:end-2, {'Team', 'HomeWins'})
%���ڿ��� �������� �߰�ȣ

% �ƽ����� �� �¸���
arsWins = T{3, 'HomeWins'} + T{3, 'AwayWins'}
%Table ����� �߰�ȣ

%���� ��� �� ���̺� �߰�
% 3 * �¸� + 1*���º�
points = T.HomeWins*3 + T.AwayWins*3 + T.HomeDraws + T.AwayDraws
T.POINTS = points

T = T(  : , [1, end, 2:end-1])
T = sortrows(T, 'POINTS', 'descend');
%T.POINTS = []; 1�� ����
%T{1, :} = []; 1�� ����

% writetable(T, 'myTable.xlsx')

%%
clear; clc;

%T = table([1; 2; 3], [5;6;7])
load('FraGerKor.mat')
T = table(Year, France, Germany, SouthKorea) %�� ���͸� Table�� ����� ���






