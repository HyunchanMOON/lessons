%Chanpter 7
% Logical Indexing!
% 특정조건을 만족하는 데이터에 접근
% 변수명(논리값)
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
% => B = A( A>4) 한줄로! A중 4보다 큰 값
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

B = A(A > 5) % =A(x), A가 5보다 큰 값을 뽑는

% AND : &, OR : |, NOT : ~

x = (pi > 3) & (A(2) < 4)

x = (pi > 3) | (A(2) >= 4)

%%
clear;clc;
load('EPLresults.mat')

%홈경기 승리수가 10승 이상인 팀의 이름
% EPL.HomeWins > 10
% EPL(EPL.HomeWins > 10, 'Team')
% EPL(EPL{: ,'HomeWins'} > 10, 'Team')lo
% EPL.Team(EPL.HomeWins > 10)

%어웨이 경기 승리수가 10승이상이고,
%홈경기 승리수가 5승 이상인 팀의 이름

EPL.Team((EPL.AwayWins > 10) & (EPL.HomeWins > 5))
EPL(EPL.AwayWins > 10 & EPL.HomeWins > 5, 'Team')
EPL{(EPL{:, 'AwayWins'} > 10) & (EPL{:, 'HomeWins'} > 5), 'Team'}
% 총 승리 수가 15승 이상인 팀의 평균 패배 수는?

L = EPL.HomeLosses((EPL.AwayWins + EPL.HomeWins) > 15)
L2 = EPL.AwayLosses((EPL.AwayWins + EPL.HomeWins) > 15)
Loss = mean(L + L2);

%%
clear; clc;

% Logical Indexing과 쓰기 좋은 함수

a = [2, 4, 9, 1]
x = any(a>3) % 하나라도 any 안 조건 만족하면 참
x = all(a>3) % 모든 데이터가 all 안 조건 만족하면 참

x = nnz(a>3) %number of non-zero ()안 조건을 만족하는 개수를 계산
x = find(a>3) %()안 조건을 만족하는 data의 위치를 찾아줌











