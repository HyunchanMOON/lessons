clear all
load carEcon.mat
mdl = fitlm(carTrain, 'FuelEcon ~ EngDisp + Weight')
X = carTrain{:, [2 6]};
Y = carTrain.FuelEcon;
mdl = fitlm(X, Y)
% ������ �������(R) 1�� ����� ���� Fitting�� �ߵȰ�.
mdl.MSE % �۰Գ��ü��� ������ ����.
testin = rand(2,2)
testout = rand(2,1)
preds = predict(mdl, testin)
testout - preds
norm(testout-preds)

mdl = fitlm(X, Y, 'y~x1^2 + x1*x2 - x1:x2 - 1')

X1 = carTrain{: , 2};
X11 = sin(X1);
X22 = exp(X1);
mdl = fitlm([X11 X22] , Y , 'y ~x1 + x2 - 1')


%% SVM
x = 0:0.1:5;
y = 3*x + 2 + 0.1*randn(size(x));
scatter(x, y)
mdl = fitrsvm(x' , y') %svm ȸ��
mdl.Epsilon
mdl.Beta %����
mdl.Bias %y����
mdl = fitrsvm(x' , y', 'Epsilon', 0.1);
mdl = fitrsvm(x' , y', 'Epsilon', 0.1, 'KernelFunction', 'gaussian'); % ������ ������ ����. Kernel�� ��� �����ϴ��Ŀ� ����.

mvnrnd(��պ���, ���л� ���)


%% Gaussian Process
f = mvnrnd([0 0 0 0 0] , eye(5))
plot(1:5, f)
hold on
f = mvnrnd([0 0 0 0 0] , eye(5))
plot(1:5, f)
f = mvnrnd([0 0 0 0 0] , eye(5))
plot(1:5, f)
f = mvnrnd([0 0 0 0 0] , eye(5))
plot(1:5, f)
f = mvnrnd([0 0 0 0 0] , eye(5))
plot(1:5, f)


%%
x = 0:0.1:5;
y = 3*x + 2 + 0.1*randn(size(x)); 
[b, info] = lasso(x', y', 'lambda', eps) % b : ����, info�� intercept: �����

y = 2*cos(0.7*x) + 0.1*randn(size(x));
scatter(x, y)
mdl = fitlm(x', y', 'y ~ x1^9')

[b, info] = lasso([x'.^9 x'.^8 x'.^7 x'.^6 x'.^5 x'.^4 x'.^3 x'.^2 x'.^1], y, 'lambda', 0:0.001:0.01);


info.MSE %���� Error���� �ּҰ� �Ǵ��� Ȯ��


