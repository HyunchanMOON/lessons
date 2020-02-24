%% Machine Learing Chapter3 Unsupervised Learing (�������н�, Clustering)

p1 = [2 3];
p2 = [5 7];
pdist([p1 ; p2]) % ���� ������ �Ÿ�, �⺻�� -> sqrt((2-5)^2 + (3-7)^2)

A= [0 1;1 0;1 1;3 4;5 2]
scatter(A(:,1), A(:,2),150) % �� ������ : ũ��

di = pdist(A) %5C2
R = cmdscale(di) % ��ǥ ����
R2 = mdscale(di) % ���� ���

rng default
A = randi([0 10], 5, 3)
di = pdist(A)
R2 = mdscale(di, 2) %2 �������� data ���
R1 = mdscale(di, 1) %1 �������� data ���


%% 
load('fisheriris.mat')
mn = zscore(meas);
var(mn)
[pcs, scores, ~,~, vexp] = pca(mn); % pca �� ������ �ս��� �ּ�ȭ �ϱ����� �������� data�� ���� �ϴ°�.
% https://bskyvision.com/347, 
% http://blog.naver.com/PostView.nhn?blogId=sw4r&logNo=221031465518&parentCategoryNo=&categoryNo=43&viewDate=&isShowPopularPosts=true&from=search
p = var(scores);
p /sum(p) * 100
p/sum(p)*100 

X = tsne(meas); % ����� �Ÿ� Data ���� ���� �����ִ� 
scatter(X(:, 1), X(:,2))
X = tsne(meas);
scatter(X(:, 1), X(:,2))
X = tsne(meas);
scatter(X(:, 1), X(:,2))
X = tsne(meas); % ��� �ҽ� ����� �ٲ��. �Ÿ��� ����

X3 = tsne(meas, 'NumDimensions', 3); % 3����
scatter3(X3(:, 1), X3(:,2), X3(:,3))


%% k means clustering
[~ , scores] = pca(meas);
scatter(scores(:, 1), scores(:,2)) %grouping�� ���� �ʾҴ�.
% Grouping �ϴ� ����
g = kmeans(scores(:, [1 2]), 3) % ���� ���ڰ� ���� �׷��̴�.
gscatter(scores(:,1),scores(:,2),g)

g = kmeans(scores(:, [1 2]), 2, 'distance', 'cosine', 'maxiter', 500);

%%
H = data.Height;
hist(H)
normplot(H) %���Ժ����� �������� Ȯ���ϴ� �Լ�
S = data.Sex;
HM = H(S=='M');
fitdist(H, 'normal')

fitdist(H, 'normal')

[~, scores] = pca(meas)
gm = fitgmdist(scores(: , [1 2]), 3) % �־��� Data�� Ȯ�� ���� ����
gm.mu
gm.Sigma
g = cluster(gm, scores(: , [1 2]))
gscatter(scores(:, 1) , scores(: , 2), g)

%% Hierachical Clustering
A = [0 0.1 ; 1 1.2 ; 1.3 0 ; 3 3.3 ; 3.2 3.3 ; 5 3.7]
scatter(A(:, 1) , A(:,2))
Y = linkage(A) % -> 1�� 2���� index 3���� �Ÿ�
dendrogram(Y)
figure(2)
scatter(A(:, 1) , A(:,2))
g = cluster(Y , 'maxclust', 3)
g = cluster(Y , 'cutoff', 0.5) % ���� ������ �������� �����ϰ� clustering

evalclusters(meas , 'kmeans', 'linkage', 'gmdistribution') % 3���� �Ѱ� ���
evalclusters(meas , 'kmeans', 'd', 'Klist', 2:5)
evalclusters(meas , 'kmeans', 'c', 'Klist', 2:5)
parallelcoords(meas)
g = kmeans(meas, 3);
parallelcoords(meas, 'Group', g)