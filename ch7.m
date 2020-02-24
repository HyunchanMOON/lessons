%Chanpter 7
% Logical Indexing!
% Ư�������� �����ϴ� �����Ϳ� ����
% ������(����)
clear; clc;

A = magic(3)
B = [];
% for i = 1:size(A,1)
%     for j = 1:size(A,2)
%         if A(i,j) > 4
%             B = [B, A(i,j)]
%         end
%     end
% end
% => B = A( A>4) ���ٷ�! A�� 4���� ū ��
% B = A(A>4)

i = [false, true, false ; true, true, false ;false, true, true];

x = A(i);

%%
clear;clc;
x = pi >3;
x = pi <3;
x = pi ~=3;
v = [1, 5, 9];
x = v < 3;
A = magic(3)
x = A > 5

B = A(A > 5) % =A(x), A�� 5���� ū ���� �̴�

% AND : &, OR : |, NOT : ~

x = (pi > 3) & (A(2) < 4)

x = (pi > 3) | (A(2) >= 4)

%%
clear;clc;
load('EPLresults.mat')

%Ȩ��� �¸����� 10�� �̻��� ���� �̸�
% EPL.HomeWins > 10
% EPL(EPL.HomeWins > 10, 'Team')
% EPL(EPL{: ,'HomeWins'} > 10, 'Team')lo
% EPL.Team(EPL.HomeWins > 10)

%����� ��� �¸����� 10���̻��̰�,
%Ȩ��� �¸����� 5�� �̻��� ���� �̸�

EPL.Team((EPL.AwayWins > 10) & (EPL.HomeWins > 5))
EPL(EPL.AwayWins > 10 & EPL.HomeWins > 5, 'Team')
EPL{(EPL{:, 'AwayWins'} > 10) & (EPL{:, 'HomeWins'} > 5), 'Team'}
% �� �¸� ���� 15�� �̻��� ���� ��� �й� ����?

L = EPL.HomeLosses((EPL.AwayWins + EPL.HomeWins) > 15)
L2 = EPL.AwayLosses((EPL.AwayWins + EPL.HomeWins) > 15)
Loss = mean(L + L2);

%%
clear; clc;

% Logical Indexing�� ���� ���� �Լ�

a = [2, 4, 9, 1]
x = any(a>3) % �ϳ��� any �� ���� �����ϸ� ��
x = all(a>3) % ��� �����Ͱ� all �� ���� �����ϸ� ��

x = nnz(a>3) %number of non-zero ()�� ������ �����ϴ� ������ ���
x = find(a>3) %()�� ������ �����ϴ� data�� ��ġ�� ã����











