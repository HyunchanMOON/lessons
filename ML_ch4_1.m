%% Naive Bayes Classification
clear; clc;
load heartdisease

HD = heartdataNum.HeartDisease;
cvpt = cvpartition(427, 'holdout', 0.3);
itr = training(cvpt);  %training data와 test dat index 구분
ite = ~itr;
ite = test(cvpt);
hdNumtr = heartdataNum(itr, :);
hdNumte = heartdataNum(ite, :);
% choose algorithm & fit model
mdl = fitcnb(hdNumtr, 'HeartDisease') % Naive Bayes Classification
mdl = fitcnb(hdNumtr, 'HeartDisease', 'DistributionNames', 'kernel')


%% Discriminant Analysis

load fisheriris.mat
[~, scores] = pca(meas);
gscatter(scores(:, 1), scores(:, 2), species)
mdl = fitcdiscr(scores(:, [1 2]), species); % 확률이 같은 부분
mdl.Coeffs
mdl.Coeffs(1, 2) %1번과 2번의 확률이 같은 지점을 나타내준다.
mdl.Coeffs(1, 2).Const
mdl.Coeffs(1, 2).Linear
% [X1+X2+....Xn][Linear] + Const = 0
hold on
x = -4:0.1:4;
y = (23.0765*x + 23.7542)/21.3069;
plot(x, y, 'r--')
axis equal

%% Support Vector Machines , 가장 성능이 좋음.

mdl = fitcsvm(hdNumtr, 'HeartDisease');
mdl.Bias
mdl.Beta

%load fisheriris.mat
[~, scores] = pca(meas);
gscatter(scores(1:100, 1), scores(1:100, 2), species(1:100))
mdl = fitcsvm(scores(1:100, [1 2]), species(1:100));
%[X1 X2 ....Xn][Beata] + Bias = 0
%[X Y][Beta] + Bias = 0
xx = -4:0.1:2;
yy = (1.1075*xx + 1.5886) / 0.5493;
hold on
plot(xx, yy, 'r--')
axis equal
mdl.IsSupportVector
plot(x(mdl.IsSupportVector), y(mdl.IsSupportVector),'o', 'markersize', 7);

mdl = fitcsvm(hdNumtr, 'HeartDisease', 'KernelFunction', 'gaussian')

%load fisheriris.mat
%mdl = fitcsvm(meas, species)
mdl = fitcecoc(meas, species);
mdl.BinaryLearners
mdl.BinaryLearners{1}
mdl.CodingMatrix
mdl.BinaryLearners{1}.KernelParameters

t = templateSVM
t = templateSVM('KernelFunction', 'gaussian')
mdl = fitcecoc(meas, species, 'Learners', t);
mdl.BinaryLearners{1}.KernelParameters
compareclassifiers








