% Chapter 6
clear; clc;
%T = readtable('EPLresults.xlsx', 'ReadRowNames', true)
% T(1,1)
% T('Arsenal', 'AwayWins')
T = readtable('EPLresults.xlsx')

%indexing
% () 사용하면 table type을 반환
% {} 사용하면 데이터 반환
x = T(1,2)
x = T(1, 'HomeWins')
%T(1,2) = {15}, T{1,2} = 15
%T.HomeWins : HomeWins 1열 

T2 = sortrows(T, 'HomeWins', 'descend');

% indexing 연습
% 어웨이 경기 승리수가 가장 많은 3개 팀의 이름

T3 = sortrows(T, 'AwayWins', 'descend');
X = T3(1:3, 'Team');

% 어웨이 경기 승리수가 가장 적은 3개 팀의 이름과 홈경기 승리수

X1 = T3(end:-1:end-2, {'Team', 'HomeWins'})
%문자열을 묶을때는 중괄호

% 아스널의 총 승리수
arsWins = T{3, 'HomeWins'} + T{3, 'AwayWins'}
%Table 연산시 중괄호

%승점 계산 후 테이블에 추가
% 3 * 승리 + 1*무승부
points = T.HomeWins*3 + T.AwayWins*3 + T.HomeDraws + T.AwayDraws
T.POINTS = points

T = T(  : , [1, end, 2:end-1])
T = sortrows(T, 'POINTS', 'descend');
%T.POINTS = []; 1열 삭제
%T{1, :} = []; 1행 삭제

% writetable(T, 'myTable.xlsx')

%%
clear; clc;

%T = table([1; 2; 3], [5;6;7])
load('FraGerKor.mat')
T = table(Year, France, Germany, SouthKorea) %열 벡터를 Table로 만드는 방법






