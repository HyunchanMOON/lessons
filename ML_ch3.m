%% Machine Learing Chapter3 Unsupervised Learing (비지도학습, Clustering)

p1 = [2 3];
p2 = [5 7];
pdist([p1 ; p2]) % 두점 사이의 거리, 기본형 -> sqrt((2-5)^2 + (3-7)^2)

A= [0 1;1 0;1 1;3 4;5 2]
scatter(A(:,1), A(:,2),150) % 맨 마지막 : 크기

di = pdist(A) %5C2
R = cmdscale(di) % 좌표 복원
R2 = mdscale(di) % 차원 축소

rng default
A = randi([0 10], 5, 3)
di = pdist(A)
R2 = mdscale(di, 2) %2 차원으로 data 축소
R1 = mdscale(di, 1) %1 차원으로 data 축소


%% 
load('fisheriris.mat')
mn = zscore(meas);
var(mn)
[pcs, scores, ~,~, vexp] = pca(mn); % pca 는 정보의 손실을 최소화 하기위해 한쪽으로 data를 가중 하는것.
% https://bskyvision.com/347, 
% http://blog.naver.com/PostView.nhn?blogId=sw4r&logNo=221031465518&parentCategoryNo=&categoryNo=43&viewDate=&isShowPopularPosts=true&from=search
p = var(scores);
p /sum(p) * 100
p/sum(p)*100 

X = tsne(meas); % 가까운 거리 Data 끼리 군집 보여주는 
scatter(X(:, 1), X(:,2))
X = tsne(meas);
scatter(X(:, 1), X(:,2))
X = tsne(meas);
scatter(X(:, 1), X(:,2))
X = tsne(meas); % 계속 할시 모양이 바뀐다. 거리는 동일

X3 = tsne(meas, 'NumDimensions', 3); % 3차원
scatter3(X3(:, 1), X3(:,2), X3(:,3))


%% k means clustering
[~ , scores] = pca(meas);
scatter(scores(:, 1), scores(:,2)) %grouping이 되지 않았다.
% Grouping 하는 과정
g = kmeans(scores(:, [1 2]), 3) % 같은 숫자가 같은 그룹이다.
gscatter(scores(:,1),scores(:,2),g)

g = kmeans(scores(:, [1 2]), 2, 'distance', 'cosine', 'maxiter', 500);

%%
H = data.Height;
hist(H)
normplot(H) %정규분포를 따르는지 확인하는 함수
S = data.Sex;
HM = H(S=='M');
fitdist(H, 'normal')

fitdist(H, 'normal')

[~, scores] = pca(meas)
gm = fitgmdist(scores(: , [1 2]), 3) % 주어진 Data의 확률 분포 추정
gm.mu
gm.Sigma
g = cluster(gm, scores(: , [1 2]))
gscatter(scores(:, 1) , scores(: , 2), g)

%% Hierachical Clustering
A = [0 0.1 ; 1 1.2 ; 1.3 0 ; 3 3.3 ; 3.2 3.3 ; 5 3.7]
scatter(A(:, 1) , A(:,2))
Y = linkage(A) % -> 1열 2열이 index 3열이 거리
dendrogram(Y)
figure(2)
scatter(A(:, 1) , A(:,2))
g = cluster(Y , 'maxclust', 3)
g = cluster(Y , 'cutoff', 0.5) % 값이 작으면 작을수록 엄격하게 clustering

evalclusters(meas , 'kmeans', 'linkage', 'gmdistribution') % 3개중 한개 사용
evalclusters(meas , 'kmeans', 'd', 'Klist', 2:5)
evalclusters(meas , 'kmeans', 'c', 'Klist', 2:5)
parallelcoords(meas)
g = kmeans(meas, 3);
parallelcoords(meas, 'Group', g)