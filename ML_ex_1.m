clear; clc;
load wineQuality.mat


[pcs, scores, ~,~, vexp] = pca(numdata); % vexp 중요도
pareto(vexp) % 총 12개에서 9개만 plot 됨 즉, 9차원으로 줄여도 손실이 5%미만이다.
scatter(scores(:,1) , scores(:,2))

% Kmeans 알고리즘
gk = kmeans(scores(:, [1 2]) , 2);
gscatter(scores(:, 1) , scores(:,2), gk)

% Gusian mixture 
gm = fitgmdist(scores(:, [1 2]) , 2);
gg = cluster(gm, scores(:, [1 2]));
figure(2);
gscatter(scores(:, 1) , scores(:, 2), gg)
