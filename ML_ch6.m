clear all
load carEcon.mat
mdl = fitlm(carTrain, 'FuelEcon ~ EngDisp + Weight')
X = carTrain{:, [2 6]};
Y = carTrain.FuelEcon;
mdl = fitlm(X, Y)
% 수정된 결정계수(R) 1에 가까울 수록 Fitting이 잘된것.
mdl.MSE % 작게나올수록 성능이 좋다.
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
mdl = fitrsvm(x' , y') %svm 회귀
mdl.Epsilon
mdl.Beta %기울기
mdl.Bias %y절편
mdl = fitrsvm(x' , y', 'Epsilon', 0.1);
mdl = fitrsvm(x' , y', 'Epsilon', 0.1, 'KernelFunction', 'gaussian'); % 수식이 나오지 않음. Kernel을 어떤걸 적용하느냐에 따름.

mvnrnd(평균벡터, 공분산 행렬)


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
[b, info] = lasso(x', y', 'lambda', eps) % b : 기울기, info의 intercept: 상수항

y = 2*cos(0.7*x) + 0.1*randn(size(x));
scatter(x, y)
mdl = fitlm(x', y', 'y ~ x1^9')

[b, info] = lasso([x'.^9 x'.^8 x'.^7 x'.^6 x'.^5 x'.^4 x'.^3 x'.^2 x'.^1], y, 'lambda', 0:0.001:0.01);


info.MSE %언제 Error값이 최소가 되는지 확인


