clear; clc;
load wineQuality.mat


[pcs, scores, ~,~, vexp] = pca(numdata); % vexp �߿䵵
pareto(vexp) % �� 12������ 9���� plot �� ��, 9�������� �ٿ��� �ս��� 5%�̸��̴�.
scatter(scores(:,1) , scores(:,2))

% Kmeans �˰���
gk = kmeans(scores(:, [1 2]) , 2);
gscatter(scores(:, 1) , scores(:,2), gk)

% Gusian mixture 
gm = fitgmdist(scores(:, [1 2]) , 2);
gg = cluster(gm, scores(:, [1 2]));
figure(2);
gscatter(scores(:, 1) , scores(:, 2), gg)
