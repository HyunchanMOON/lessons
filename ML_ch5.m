%% Chapter 5

clear; clc;
load heartdisease.mat
cvpt = cvpartition(427, 'holdout', 0.3)
cvpt = cvpartition(427, 'LeaveOut')
cvpt = cvpartition(427, 'kfold', 5)

itr = training(cvpt, 2);
ite = test(cvpt, 2); % n개로 나눠야함
mdl = fitcknn(heartdataNum, 'HeartDisease', 'cvpartition', cvpt); % 알아서 n개의 모델로 구성해줌
mdl = fitcknn(heartdataNum, 'HeartDisease', 'kfold', 5);
mdl.Trained

kfoldLoss(mdl) % Loss 값들의 평균
%% Hyperparameter Optimization

mdl = fitcknn(heartdataNum, 'HeartDisease');

mdl = fitcknn(heartdataNum, 'HeartDisease', 'OptimizeHyperparameters', 'auto');
mdl = fitcknn(heartdataNum, 'HeartDisease', 'OptimizeHyperparameters', 'all');
s.MaxObjectiveEvaluations = 40;
mdl = fitcknn(heartdataNum, 'HeartDisease', 'OptimizeHyperparameters', 'all', 'HyperparameterOptimizationOptions',s);

%% Feature Transformation
load healthdata.mat
W = data.Weight;
B = data.BMI;
A = data.Age;
scatter(W, B)
scatter(W, A)
corr(W, B)
corr(W, A, 'rows', 'complete') % Nan 포함됐을때


X = data{ : , [3 8 9 10 11 12 13]};
X(any(isnan(X) , 2) , :) = [];
Xn = zscore(X);

[lambda, ~, ~, ~, F] = factoran(Xn, 3);

%% Built in Feature Selection
clear; clc;
load fisheriris.mat
mdl = fitctree(meas, species);
view(mdl, 'mode', 'graph')
p = predictorImportance(mdl)
p/sum(p) * 100

mdl = fitctree(meas(:, [3 4]), species); % 가공하지 않고 차원을 축소
view(mdl, 'mode', 'graph')

%%
clear; clc;
load heartdisease.mat
HD = heartdataNum.HeartDisease;

%%
clear; clc;
load fisheriris.mat
% species = categorical                                                                                                            nkkkkkkkjjff

load fisheriris.mat
%[ms, ds] = bootstrap(3, @mean, a)

%%
clear all
load heartdisease.mat
mdl = fitcensemble(heartdataNum, 'HeartDisease', 'NumLearningCycles', 50, 'Method', 'bag', 'Learners', 'tree');

newpd = rand(1, 11);
[preds, prob] = predict(mdl, newpd)

% prob * 50 중 큰값






