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
data{1, {'Sex', 'Age'}} %중괄호는 같은 Data Type 만 접근 가능!

isequaln(data{:,3},data.Age) %같은 결과이다. isequaln -> 같으면 1, 다르면 0

T.Properties %Properties Table 속성 확인하는 함수
T.Properties.VariableUnits = {'cm', 'kg'} % 속성에 단위정보 추가
A = magic(2)
I = [false true ; true false]
I = A>2

I = data.BPSyst1 > 130;


A = [1 2 1 2 1 1 2]
C = categorical(A) % 범주형


S = data.Sex;
H = data.Height;
W = data.Weight;
scatter(H,W)
xlabel('Height')
gscatter(H, W, S) % 어느 그룹에 data인지 파악하게 해주는 함수 gscatter

mean(H)
m = grpstats(H, S) %각 카테고리별 계산
A = magic(3)
A(2,3) = nan
nanmean(A) % nan을 제거한 평균

A(any(isnan(A),2), :) = [] %nan이 포함된 행을 날리는것
rmmissing(A)% nan이 포함된 행을 날리기.


%% data 전처리

HW = data{:, [8 9]}; % 각 열의 단위가 다르다.

zscore % => data - 평균 / 표준편차

mynomalize % => data - 최소값 / 최대 - 최소